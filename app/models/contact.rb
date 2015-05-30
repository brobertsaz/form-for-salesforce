class Contact < ActiveRecord::Base
  require "addressable/uri"
  SALESFORCE_PATH = "https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8"
  after_create :send_to_salesforce

  def send_to_salesforce
    # if Rails.env.production?

    response = Curl::Easy.http_post(SALESFORCE_PATH, attr_for_sf)
    self.sent_to_sales_force = response.response_code == 200
    save

      # Send notification of error in contacting Salesforce

    # end
  end

protected
  def attr_for_sf
    to_query_string({
      "first_name" => first_name,
      "last_name" => last_name,
      "email" => email,
      "company" => company,
      "city" => city,
      "state" => state,
      "oid" => "00Do0000000Yamb",
      "retURL" => ""
    })
  end

  def to_query_string(val)
    uri = Addressable::URI.new
    uri.query_values = val
    uri.query
  end
end