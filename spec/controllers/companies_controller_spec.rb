require 'rails_helper'

RSpec.describe CompaniesController, :type => :controller do
  let(:cnpj_valido1) { 67286015000139 }
  let(:cnpj_valido2) { 50304411000149 }
  let(:vaga) {{:title => "Vaga 1",  :description => "descrição um 2 tres", :location => "zona sul", :expiration_date => "01/03/2015", :job_status => "Ativa"}}
  let(:company1) {{:fantasy_name => "nome teste",   :cnpj => cnpj_valido1, :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"}}
  let(:company2) {{:fantasy_name => "nome teste",   :cnpj => cnpj_valido2, :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"}}
  describe "General Admin signed in" do
    before do 
      @admin = GeneralAdmin.create!({
      :email => 'users@test.com',
      :password => '12please',
      :password_confirmation => '12please' 
     })
      sign_in @admin
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "Should load all companies" do
        c1 = Company.create!(company1)
        c2 = Company.create!(company2)
        get :index
        expect(assigns(:empresas)).to match_array([c2, c1]) 
      end
    end

    describe "GET jobs list" do
      it "List jobs" do
        c1 = Company.create!(company1)
        @c1 = c1
        @j1 = JobPosition.create!(vaga)
        @c1.job_positions << @j1
        @c1.reload
        get :show, id: @c1
        expect(response).to have_http_status(:success)
      end
    end
    describe "#New" do
      it "Should render new" do
        get :new
        expect(response).to render_template(:new)
      end
    end
    describe "#Create" do
      it "Should create a company" do
        company1created = Company.create!(company1)
        post :create , :company => company1
        expect(Company.first).to eq(company1created)
      end 
    end
    describe "#Edit" do
      it "Should render edit" do
        c1 = Company.create!(company1)
        get :edit, :id => c1.id
        expect(response).to render_template(:edit)
      end
    end


    describe "Post Update test" do
      it "Company updated" do
        c1 = Company.create!(company1)
        put :update, :id => c1.id, :company => {:fantasy_name => "vitor novo", :cnpj => cnpj_valido1, :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"}
        c1.reload
        expect(c1.fantasy_name).to eq("vitor novo")
      end
    end   
  end
  describe "General Admin didn't sign in" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "Should load all companies" do
        c1 = Company.create!(company1)
        c2 = Company.create!(company2)
        get :index
        expect(assigns(:empresas)).to match_array([c2, c1]) 
      end
    end

    describe "GET jobs list" do
      it "List jobs" do
        c1 = Company.create!(company1)
        @c1 = c1
        @j1 = JobPosition.create!(vaga)
        @c1.job_positions << @j1
        @c1.reload
        get :show, id: @c1
        expect(response).to have_http_status(:success)
      end
    end
    describe "#New" do
      it "Should render new" do
        get :new
        expect(response).to render_template(:new)
      end
    end
    describe "#Create" do
      it "Should create a company" do
        company1created = Company.create!(company1)
        post :create , :company => company1
        expect(Company.first).to eq(company1created)
      end 
    end
    describe "#Edit" do
      it "Should render edit" do
        c1 = Company.create!(company1)
        get :edit, :id => c1.id
        expect(response).to render_template(:edit)
      end
    end


    describe "Post Update test" do
      it "Company updated" do
        c1 = Company.create!(company1)
        put :update, :id => c1.id, :company => {:fantasy_name => "vitor novo", :cnpj => cnpj_valido1, :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"}
        c1.reload
        expect(c1.fantasy_name).to eq("vitor novo")
      end
    end   
  end
end