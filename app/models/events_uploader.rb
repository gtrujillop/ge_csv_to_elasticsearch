require 'csv'
class EventsUploader
  attr_accessor :errors, :csv_processor

  def initialize(csv_processor)
    @csv_processor = csv_processor
    @processed = 0
    @non_processed = 0
    @errors = []
  end

  def import_events
    file = @csv_processor.read_file
    CSV.foreach(file, headers: true, :col_sep => ";") do | row |
      record = CsvRecordsGe.new(format_row(row))
      if record.save
        @processed += 1
      else
        @errors << record.errors.full_messages.join(',')
        @non_processed += 1
      end
    end
    update_processor_status
  rescue StandardError => e
    Rails.logger.error e.inspect
    @csv_processor.status = :failed
    @csv_processor.save!
  end

  def update_processor_status
    @csv_processor.processed = @processed
    @csv_processor.non_processed = @non_processed
    @csv_processor.error_trace = @error_trace
    if successful?
      @csv_processor.status = :processed
    elsif any_processed
      @csv_processor.status = :partially_processed
    else
      @csv_processor.status = :failed
    end
    @csv_processor.save!
  end

  private

  def format_row(row)
    values = row.to_hash
    event_address = values['mipr_u_delivery_adress']
    values.except!('mipr_u_delivery_adress')
    values['event_address'] = event_address
    values
  end

  def successful?
    @errors.empty?
  end

  def any_processed?
    @processed > 0
  end
end
