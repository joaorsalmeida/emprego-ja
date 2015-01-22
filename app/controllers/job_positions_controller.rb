class JobPositionsController < ApplicationController
  def index
  	@job_position = JobPosition.all
  end

  def new
    @job_position = JobPosition.new
  end
end