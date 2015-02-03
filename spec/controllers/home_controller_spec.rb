 require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  let(:vaga) {{:title => "Vaga 1",  :description => "descrição um 2 tres", :location => "zona sul", :expiration_date => "01/03/2015", :job_status => "Ativa"}}
  let(:empresa){{:fantasy_name => "nome teste",   :cnpj => 67286015000139, :url => "www.teste", :email => "eumesmo@eu.com", :phone => "23232373"}}
  before(:each) do
    @company = Company.create!(empresa)
    10.times do
      job = JobPosition.create!(vaga)      
      @company.job_positions << job
    end
  end
  describe "show last 10 created job positions" do
    it "mostra apenas 10 vagas" do
      get :index
      jobs = assigns(:job_positions)
      expect(jobs.length).to eq(10) 
    end
  end

  describe "not listing canceled job_positions" do
    it "mostra apenas 9 vagas" do
      job = JobPosition.first
      job.job_status = "Cancelada"
      job.save
      get :index
      jobs = assigns(:job_positions)
      expect(jobs.length).to eq(9) 
    end
  end
 end