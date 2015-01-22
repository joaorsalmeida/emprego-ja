class CompaniesController < ApplicationController
  def index
  	@empresas = Company.all
  end

  def show

  	 @empresa = Company.find(params[:id])

  end
end
