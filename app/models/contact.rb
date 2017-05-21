class Contact < ActiveRecord::Base
  before_save :capitalize_first_name, :capitalize_last_name, :downcase_email_address, :normalize_phone_number

  private

  def capitalize_first_name
    first_name.capitalize!
  end

  def capitalize_last_name
    last_name.capitalize!
  end

  def downcase_email_address
    email_address.downcase!
  end

  def normalize_phone_number
    phone_number.gsub!(/\s|-|\.|\(|\)/, "").downcase!
  end
end
