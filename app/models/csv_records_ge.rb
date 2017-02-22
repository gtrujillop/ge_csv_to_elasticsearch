class CsvRecordsGe < ActiveRecord::Base
  searchkick locations: [:location]
  before_save :calculate_coordinates

  def calculate_coordinates
    return unless event_address.present?
    country = ISO3166::Country.find_country_by_name(country_name_from_address)
    if country.present?
      self.event_latitude = country.latitude_dec
      self.event_longitude = country.longitude_dec
    end
  end

  def country_name_from_address
    # Based on this Address format
    # AV. SANTO TORIBIO NO 115 INT. 701,27,SAN ISIDRO,PERU
    # Extracts the last piece (PERU)
    country_name = event_address.split(',').last.capitalize
    country_name
  end

  def search_data
    attributes.merge location: { lat: event_latitude, lon: event_longitude }
  end
end
