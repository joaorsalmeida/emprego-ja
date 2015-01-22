require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "Should load all companies" do
    	c1= Company.create ({:fantasy_name => "nome teste", :cnpj => "99999999999999", :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"})
    	c2= Company.create ({:fantasy_name => "nome teste 2", :cnpj => "99999999999999", :url => "www.teste", :email => "emo@eu.com", :phone => "99929999"})
    get :index
    expect(assigns(:empresas)).to match_array([c1, c2]) 
    end

  end

end
