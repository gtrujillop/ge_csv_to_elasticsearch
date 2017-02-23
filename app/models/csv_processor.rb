class CsvProcessor < ActiveRecord::Base
  enum status: [:started, :processed, :partially_processed, :failed]

  def process_csv(csv_file)
    uploader = EventsUploader.new(csv_file, self)
    uploader.import_events
  end
end
