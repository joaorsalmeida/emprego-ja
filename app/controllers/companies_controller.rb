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
	
	def create
		@empresa = Company.new(empresa_params)
    if @empresa.save 
      redirect_to @empresa
    else 
      render "new"
    end
  end

    def empresa_params
    params.require(:company).permit(:fantasy_name, :cnpj, :url, :email, :phone)
   	end
end
