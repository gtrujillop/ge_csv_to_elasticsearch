class CsvRecordsGe < ActiveRecord::Base
  geocoded_by :event_address
  after_validation :geocode          # auto-fetch coordinates
  reverse_geocoded_by :event_latitude, :event_longitude
  after_validation :reverse_geocode  # auto-fetch address

  searchkick
end
