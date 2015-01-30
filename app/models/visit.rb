class Visit < ActiveRecord::Base
  belongs_to :job_position

  geocoded_by :ip
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
