class CompaniesController < ApplicationController
  def index
  	@empresas = Company.all
  end

  def show
  	 @empresa = Company.find(params[:id])
  end

  def new
    @empresa = Company.new
	end 
 end
