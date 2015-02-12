class JobApplicationsController < ApplicationController

	def new
		@job_application = JobApplication.new
	end

	def create
		@job_application = JobApplication.new(application_params)
	  @job_application.job_position = JobPosition.find(params[:job_position_id])
    if @job_application.save
      redirect_to [@job_application.job_position.company, @job_application.job_position]
    	flash[:notice] = "Candidatura aplicada com sucesso"
    else
      redirect_to [@job_application.job_position.company, @job_application.job_position]
    	flash[:notice] = "Candidatura não foi aplicada"
    end
	end

private
  def application_params
    params.require(:job_application).permit(:name, :resume, :jobs, :school, :salary)
  end
end