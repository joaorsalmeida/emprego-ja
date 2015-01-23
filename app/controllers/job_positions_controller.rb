class JobPositionsController < ApplicationController
  def index
  	@job_position = JobPosition.all
  end

  def new
    @job_position = JobPosition.new
  end

  def show
    @job_position = JobPosition.find(params[:id])
  end

  def job_position_params
    params.require(:job_position).permit(:title, :description, :expiration_date, :loction, :job_status)
  end

end