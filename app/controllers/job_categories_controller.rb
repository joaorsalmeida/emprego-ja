class JobCategoriesController < ApplicationController
	def index
    @categories = JobCategory.all
  end

  def new
    @category = JobCategory.new
	end

	def create
    @category = JobCategory.new(category_params)
    if @category.save
      redirect_to @category
    else
      render "new"
    end
  end

  def show
    @categoria = JobCategory.find(params[:id])
    @job_positions = JobPosition.all.where(job_category_id: @categoria.id)
  end
  
  def edit
  end

  def update
  end

private
  def category_params
    params.require(:job_category).permit(:description)
  end
end