require 'rails_helper'

RSpec.describe JobApplication, :type => :model do
	let(:cadastroCompleto) {{name: "Diego Alves", resume: "cv atualizado"}}
  let(:vaga_ativa) 			 {{:title => "Gerente", :description => "Vendas a Varejo", :location => "Zona Sul", :job_status => "Ativa", :company_id => 1}}

	before (:each) do
		@cadastro = JobApplication.new(cadastroCompleto)
		@vaga 		= JobPosition.create(vaga_ativa)
	end

	describe "presence validate" do
		it "application ok" do
			@cadastro.save
			expect(JobApplication.all.length).to eq(1)
		end
		it "name empty" do
			@cadastro.name = nil
			@cadastro.save
			expect(@cadastro.errors.messages.length).to eq(1)
		end
		it "resume empty" do
			@cadastro.resume = nil
			@cadastro.save
			expect(@cadastro.errors.messages.length).to eq(1)
		end
	end
end
