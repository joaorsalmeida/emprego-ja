require 'rails_helper'

describe Company, :type => :model do
  let(:cnpj_valid) { 50304411000149 }
	let(:company_ok) {{fantasy_name: "padrao", cnpj: cnpj_valid, url: "padrao.com.br", email: "padrao@default.com", phone: 12322332}}
	
	describe "presence validate" do
		let(:message) { "não pode ficar em branco" }
		
		before (:each) do
			@company = Company.new(company_ok)
		end
		it "company ok" do
			@company.save
			expect(Company.all.length).to eq(1)
		end
		it 	"empty fantasy_name" do
			@company.fantasy_name = nil
			@company.save
			expect(@company.errors.messages[:fantasy_name][0]).to eq(message)
		end
		it "empty cnpj" do
			@company.cnpj = nil
			@company.save
			expect(@company.errors.messages[:cnpj][0]).to eq(message)
		end
		it "empty url" do
			@company.url = nil
			@company.save
			expect(@company.errors.messages[:url][0]).to eq(message)
		end
		it "empty email" do
			@company.email = nil
			@company.save
			expect(@company.errors.messages[:email][0]).to eq(message)
		end
		it "empty phone" do
			@company.phone = nil
			@company.save
			expect(@company.errors.messages[:phone][0]).to eq(message)
		end
	end
end
