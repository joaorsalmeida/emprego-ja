class CompaniesController < ApplicationController
  def index
  	@empresas = Company.all
  end
end
