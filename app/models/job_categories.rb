class JobCategories < ActiveRecord::Base
	has_many :job_positions
end
