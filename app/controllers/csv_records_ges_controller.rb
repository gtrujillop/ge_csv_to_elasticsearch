class CsvRecordsGesController < ApplicationController
  def new
    @record = CsvRecordsGe.new
  end

  def create
    CsvRecordsGe.transaction do
      @uploader = EventsUploader.new(csv_records_ges_params['events_csv'].path)
      @uploader.import_events
      # unless @uploader.successful?
      #   raise ActiveRecord::Rollback, "No se pudo cargar el archivo, verifique los datos."
      # end
    end
    # TODO redirect to locations index
    flash[:error] = "Elementos inválidos en el archivo, verifique."
    redirect_to new_csv_records_ge_path
  rescue
    flash[:error] = "Formato de archivo inválido, verifique que sea CSV."
    redirect_to new_csv_records_ge_path
  end

  def index
    #code
  end

  def csv_records_ges_params
    params.require(:csv_records_ge).permit(:events_csv)
  end
end
