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

  def edit
   @empresa = Company.find(params[:id])
  end

  def update
    @empresa = Company.find(params[:id])
    if @empresa.update(empresa_params)
       redirect_to @empresa
    else
      render "edit"
    end  
  end

  def empresa_params
    params.require(:company).permit(:fantasy_name, :cnpj, :url, :email, :phone)
	end
end
