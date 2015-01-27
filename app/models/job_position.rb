class JobPosition < ActiveRecord::Base
	belongs_to :company
	has_many :visits
	validates_presence_of :title, :description, :location, :expiration_date, :job_status
	validates_length_of :title, maximum: 100
	validates :job_status, inclusion: { in: %w(Ativa Desativada Cancelada)}

	def max_expiration
		@max_expiration = (Date.today + 90)
	end

	def canceled?
		job_status == "Cancelada"
	end
end