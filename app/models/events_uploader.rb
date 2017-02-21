require 'csv'
class EventsUploader
  attr_accessor :errors

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    self.errors = []
  end

  def import_events
    CSV.foreach(@csv_file_path, headers: true, :col_sep => ";", :skip_blanks => true) do | row |
      record = CsvRecordsGe.new(format_row(row))
      errors << record.errors.full_messages.join(',') unless record.save
    end
  end

  def successful?
    errors.empty?
  end

  private

  def format_row(row)
    values = row.to_hash
    event_address = values['mipr_u_delivery_adress']
    values.except!('mipr_u_delivery_adress')
    values['event_address'] = event_address
    values
  end
end
