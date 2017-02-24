class CsvProcessor < ActiveRecord::Base
  enum status: [:started, :processed, :partially_processed, :failed]
  has_attached_file :file,
                    storage: :s3

  validates_attachment_content_type :file, content_type: ["text/csv", "text/plain"]

  def process_csv
    uploader = EventsUploader.new(self)
    uploader.import_events
  end

  def read_file
    s3_file = file.s3_object(file.default_style).get
    s3_file.read
  end
end
