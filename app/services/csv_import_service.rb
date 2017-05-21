require 'csv'

class CsvImportService
  def import(file)
    CSV.foreach(file, headers: true) do |row|
      contact = Contact.new(
      first_name: row[0],
      last_name: row[1],
      email_address: row[2],
      phone_number: row[3],
      company_name: row[4]
      )
      contact.save
    end
  end
end
