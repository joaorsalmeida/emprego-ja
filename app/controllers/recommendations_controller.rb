class RecommendationsController < ApplicationController
  def new
  	@empresa = Company.find(params[:company_id])
    @recomendacao = Recommendation.new
  end

  def create
    @recomendacao = Recommendation.new(recommendation_params)
    empresa = Company.find(params[:company_id])
    @recomendacao.company = empresa
    @recomendacao.save
    if @recomendacao.save
      redirect_to empresa
    else
      render "new"
    end
  end

  private

   def recommendation_params
    params.require(:recommendation).permit(:name, :email, :recommend)
   end
end
