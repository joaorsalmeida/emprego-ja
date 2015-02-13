class CompaniesController < ApplicationController

  before_action :authenticate_general_admin!, except: [:index, :show, :edit, :update ]

  def index
    @empresas = Company.all
  end

  def show
    @empresa = Company.find(params[:id])
    @vagas = @empresa.job_positions
  end

  def new
    @empresa = Company.new
    @new = @empresa.new_company?
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
    @empresa = Company.find(params[:id])
    authentication
    @new = @empresa.new_company?
  end

  def update
    @empresa = Company.find(params[:id])
    authentication
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
  def authentication
    unless general_admin_signed_in? || company_admin_signed_in? && @empresa.id == current_company_admin.company_id
      redirect_to root_path
    end
  end
end