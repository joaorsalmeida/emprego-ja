class JobPositionsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @job_positions = @company.job_positions.all
  end

  def new
    @job_position = JobPosition.new
    @job_position.company = Company.find(params[:company_id])
    @min_expiration = Date.today
    @max_expiration = @job_position.max_expiration
  end

  def create
    @job_position = JobPosition.new(job_position_params)
    @job_position.company = Company.find(params[:company_id])
    if @job_position.save 
      redirect_to [@job_position.company, @job_position]
    else
      render "new"
    end
  end

  def edit
    @job_position = JobPosition.find(params[:id])
    @min_expiration = @job_position.created_at
    @max_expiration = @job_position.max_expiration
    flash[:notice] = "Vaga já foi cancelada!" if @job_position.canceled?
    redirect_to [@job_position.company, @job_position] if @job_position.canceled?
  end

  def update
    @job_position = JobPosition.find(params[:id])
    @company = Company.find(params[:company_id])
    @job_position.company = @company
    if @job_position.update(job_position_params)
      redirect_to [@company, @job_position]
    else
      render "edit"
    end
  end

  def job_position_params
    params.require(:job_position).permit(:title, :description, :location, :expiration_date, :job_status, :featured)
  end

  def show
    @job_position = JobPosition.find(params[:id])
    Visit.create({ip:request.remote_ip, job_position:@job_position})
    @visits = @job_position.visits.where("created_at > ?", 1.day.ago).count
    @empresa = @job_position.company
    @new_job_position = @job_position.new_job_position?
    @last_expiration_days = @job_position.last_expiration_days?
    @featured = @job_position.featured?
  end
  
  def expired
    @job_positions = JobPosition.expired
  end
end