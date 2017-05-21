require 'rails_helper'

describe CsvImportService do
  context "#import" do
    let(:file) { 'data.csv' }
    let(:csv_import_service) { CsvImportService.new }

    before do
      csv_import_service.import(file)
    end

    it "creates a contact for every row in the data.csv file" do
      expect(Contact.count).to eq 200
    end

    it "creates a contact with id: 1 from the first row in the data.csv file" do
      expect(Contact.first.id).to eq 1
    end

    it "creates a contact with id: 200 from the last row in the data.csv file" do
      expect(Contact.last.id).to eq 200
    end

    it "assigns contact values from data.csv file to the correct key" do
      contact = Contact.first
      expect(contact.first_name).to eq "Gerhard"
      expect(contact.last_name).to eq "Kautzer"
      expect(contact.email_address).to eq "gerhardkautzer@cronabayer.com"
      expect(contact.phone_number).to eq "12076431816"
      expect(contact.company_name).to eq "Hodkiewicz-Lynch"
    end
  end
end
