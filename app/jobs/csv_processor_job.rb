class CsvProcessorJob < ActiveJob::Base
  def perform(processor)
    processor.process_csv
  end
end
