class Api::V1::ContactsController < Api::V1::BaseController
  skip_before_filter :verify_authenticity_token

  def index
    respond_with Contact.all
  end

  def import
    csv_import_service = CsvImportService.new
    csv_import_service.import(params[:name].original_filename)
    redirect_to :back
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to root_url
  end

  private

  def contact_params
    params.require(:contact).permit(:id, :first_name, :last_name, :email_address, :phone_number, :company_name)
  end
end
