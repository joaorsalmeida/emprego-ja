class JobPositionsController < ApplicationController
  def index
  	@job_positions = JobPosition.all
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

  def edit
    @job_position = JobPosition.find(params[:id])
    redirect_to @job_position if @job_position.canceled?
  end

  def update
    @job_position = JobPosition.find(params[:id])
    if @job_position.update(job_position_params)
      redirect_to @job_position
    else
      render "edit"
    end
  end

	def job_position_params
    params.require(:job_position).permit(:title, :description, :location, :expiration_date, :job_status)
  end

  def show
    @job_position = JobPosition.find(params[:id])
    Visit.create({ip:request.remote_ip, job_position:@job_position})
    @visits = @job_position.visits.where("created_at > ?", 1.day.ago).count
  end
end