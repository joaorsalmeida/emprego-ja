class JobCategory < ActiveRecord::Base
	has_many :job_positions
end
