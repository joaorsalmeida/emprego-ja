class JobCategory < ActiveRecord::Base
	has_many :job_positions
  scope :job_category_filter, -> { JobCategory.joins(:job_positions).where("job_status =?","Ativa").distinct}
end