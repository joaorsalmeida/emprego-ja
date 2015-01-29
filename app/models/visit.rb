class Visit < ActiveRecord::Base
	belongs_to :job_position

	geocoded_by :ip
	after_validation :geocode
end
