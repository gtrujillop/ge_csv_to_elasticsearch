class CsvProcessorJob < ActiveJob::Base
  def perform(csv_file)
    processor = CsvProcessor.create(status: :started)
    processor.process_csv(csv_file)
  end
end
