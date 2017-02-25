class CsvProcessorsController < ApplicationController
  def new
    @processor = CsvProcessor.new(status: :started)
  end

  def create
    file = csv_processor_params[:file].tempfile
    @processor = CsvProcessor.new(status: :started, file: File.open(file))
    if @processor.save!
      #flash[:alert] = "Procesando archivo CSV."
      #@processor.process_csv
      CsvProcessorJob.perform_later(@processor)
      flash[:alert] = "Procesando archivo CSV."
     else
       flash[:error] = "Error procesando archivo CSV."
    end
    redirect_to new_csv_processor_path
  end

  def index
    #code
  end

  def csv_processor_params
    params.require(:csv_processor).permit(:file)
  end
end
