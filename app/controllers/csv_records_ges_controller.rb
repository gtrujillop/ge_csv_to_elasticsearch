class CsvRecordsGesController < ApplicationController
  def new
    @record = CsvRecordsGe.new
  end

  def create
    CsvProcessorJob.perform_later(csv_records_ges_params['events_csv'].path)
    flash[:alert] = "Procesando archivo CSV."
    redirect_to new_csv_records_ge_path
  end

  def index
    #code
  end

  def csv_records_ges_params
    params.require(:csv_records_ge).permit(:events_csv)
  end
end
