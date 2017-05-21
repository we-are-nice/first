require "rails_helper"

RSpec.describe Contact, type: :model do
  let(:contact) { FactoryGirl.create(:contact, first_name: "james", last_name: "BoND", email_address: "Jbond@SPY.COM", phone_number: "(724)196-9470 X998", company_name: "MI6")}

  context "normalization" do
    it "capitalizes the first name" do
      expect(contact.first_name).to eq("James")
    end

    it "capitalizes the last name" do
      expect(contact.last_name).to eq("Bond")
    end

    it "downcases the email address" do
      expect(contact.email_address).to eq("jbond@spy.com")
    end

    it "normalizes a phone number with an extension" do
      expect(contact.phone_number).to eq("7241969470x998")
    end

    it "normalizes a phone number without an extension" do
      contact.update_attribute(:phone_number, "(724)196-9470")
      expect(contact.phone_number).to eq("7241969470")
    end

    it "normalizes a phone number without international prefix" do
      contact.update_attribute(:phone_number, "1-(724)196-9470")
      expect(contact.phone_number).to eq("17241969470")
    end
  end
end
