class CsvProcessorJob < ActiveJob::Base
  def perform(processor)
    processor.process_csv
  rescue Resque::TermException
    Resque.enqueue(CsvProcessorJob, processor)
  end
end
