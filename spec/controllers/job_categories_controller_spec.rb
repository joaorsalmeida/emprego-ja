require 'rails_helper'

RSpec.describe JobCategoriesController, :type => :controller do
  let(:category1) {{description: "porteiro"}}
  let(:category1created) {{id: 1, description: "porteiro", created_at:Time.now, updated_at:Time.now}}
  let(:category2) {{description: "recepcionista"}}
  let(:vaga) {{:title => "Vaga 1",  :description => "descrição um 2 tres", :location => "zona sul", :expiration_date => Date.today, :job_status => "Ativa",}}

  describe "#new" do 
    it "should render new" do 
      get :new  
      expect(response).to render_template(:new)
    end
  end
  describe "#create" do
    it "Should create a new job category" do
      post :create , :job_category => (category1)
      categorycreated = JobCategory.new(category1created)
      expect(JobCategory.last).to eq(categorycreated)
    end
  end  
  describe "#show" do 
    it "Should list all job positions associated to the respective job category" do
      @category1created = JobCategory.create!(category1)
      @vaga = JobPosition.create!(vaga)
      @vaga.job_category_id = @category1created.id
      get :show, id: @vaga.id
      expect(response).to have_http_status(:success)
    end
  end
end