class CompaniesController < ApplicationController

  before_action :authenticate_general_admin!, only: [:new, :create]

  def index
    @empresas = Company.all
  end

  def show
    @empresa = Company.find(params[:id])
  end

  def new
    @empresa = Company.new
    @empresa.build_company_admin
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
    user_authentication  #the authentication(method) will load the company and do the authentication
  end

  def update
    user_authentication  #the authentication(method) will load the company and do the authentication
    if @empresa.update(empresa_params)
      redirect_to @empresa
    else
      render "edit"
    end
  end
private
  def empresa_params
    params.require(:company).permit(:fantasy_name, :cnpj, :url, :email, :phone, :avatar, :company_admin_attributes => [:email,:password])
  end
  def user_authentication
    @empresa = Company.find(params[:id])
    unless general_admin_signed_in? || company_admin_signed_in? && @empresa.id == current_company_admin.company_id
      redirect_to root_path
    end
  end
end