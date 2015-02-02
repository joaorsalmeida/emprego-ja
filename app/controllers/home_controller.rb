class HomeController < ApplicationController
  def index
    @job_positions = JobPosition.where("job_status = ?", 'Ativa').order(created_at: :desc).limit(10) 
  end
end
