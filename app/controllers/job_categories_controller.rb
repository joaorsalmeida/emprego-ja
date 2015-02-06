class JobCategoriesController < ApplicationController
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