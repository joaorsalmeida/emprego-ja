class JobApplication < ActiveRecord::Base
	belongs_to :job_position

  validates_presence_of :name, :resume
end
