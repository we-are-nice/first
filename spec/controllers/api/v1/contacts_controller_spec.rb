require "rails_helper"

describe Api::V1::ContactsController do
  let!(:contact_1) { FactoryGirl.create(:contact, id: 1)}
  let!(:contact_2) { FactoryGirl.create(:contact, id: 2)}

  before do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "#index" do
    it "should route from GET /contacts" do
      expect({get: "api/v1/contacts"}).to route_to(controller: "api/v1/contacts", action: "index")
    end

    it "returns all contacts" do
      get :index, {}
      expect(Contact.count).to eq 2
    end

    it "responds with http status 200" do
      get :index, {}
      expect(response.status).to eq 200
    end
  end

  describe "#import" do
    let(:csv_import_service) { instance_double("CsvImportService")}
    let(:file) { 'data.csv'}

    before do
      allow(CsvImportService).to receive(:new).with(no_args).and_return(csv_import_service)
    end

    it "responds with http status 201" do
      expect(csv_import_service).to receive(:import).with(file)
      post :import, { file: file }
    end
  end

  describe "#destroy" do
    it "has one less contact after deleting a contact" do
      delete :destroy, { id: 1 }
      expect(Contact.count).to eq 1
    end

    it "responds with http status 204" do
      delete :destroy, { id: 1 }
      expect(response.status).to eq 204
    end
  end

end
