require 'rails_helper'

RSpec.describe JobCategoriesController, :type => :controller do
  let(:category1) {{description: "porteiro"}}
  let(:category2) {{description: "recepcionista"}}
  describe "#new" do 
    it "should render new" do 
      get :new  
      expect(response).to render_template(:new)
    end
  end
  describe "#create" do
    it "Should create a new job category" do
      post :create , :job_category => (category1)
      categorycreated = JobCategory.create!(category1)
      categorycreated.id = 1
      expect(JobCategory.last).to eq(categorycreated)
    end
  end  
  describe "#show" do 
    it "Sdhould list all job positions associated to the respective job category"   
  end
end