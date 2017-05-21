class Api::V1::ContactsController < Api::V1::BaseController
  def index
    respond_with Contact.all
  end

  def import
    csv_import_service = CsvImportService.new
    collection = csv_import_service.import(params[:file])
    respond_with collection, location: nil
  end

  def destroy
    respond_with Contact.destroy(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:id, :first_name, :last_name, :email_address, :phone_number, :company_name)
  end
end
