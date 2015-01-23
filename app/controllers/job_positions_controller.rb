class JobPositionsController < ApplicationController
  def index
  	@job_position = JobPosition.all
  end

  def new
    @job_position = JobPosition.new
    @min_expiration = Date.today
    @max_expiration = (Date.today + 90)
  end

	def create
		@job_position = JobPosition.new(job_position_params)
  	if @job_position.save 
    	redirect_to @job_position
  	else 
    	render "new"
  	end
	end
	def job_position_params
    params.require(:Job_position).permit(:title, :description, :location, :expiration_date, :job_status)
  end
end