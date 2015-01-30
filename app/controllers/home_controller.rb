class HomeController < ApplicationController
  def index
    @job_positions = JobPosition.order(created_at: :desc).limit(10)
  end
end
