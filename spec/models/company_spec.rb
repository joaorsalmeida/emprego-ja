require 'rails_helper'

describe Company, :type => :model do
	let(:company_ok){{fantasy_name: "padrao", cnpj: 12322332233223, url: "padrao.com.br", email: "padrao@default.com", phone: 12322332}}
	describe "presence validate" do
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
			expect(@company.errors.messages[:fantasy_name][0]).to eq("can't be blank")
		end
		it "empty cnpj" do
			@company.cnpj = nil
			@company.save
			expect(@company.errors.messages[:cnpj][0]).to eq("can't be blank")
		end
		it "empty url" do
			@company.url = nil
			@company.save
			expect(@company.errors.messages[:url][0]).to eq("can't be blank")
		end
		it "empty email" do
			@company.email = nil
			@company.save
			expect(@company.errors.messages[:email][0]).to eq("can't be blank")
		end
		it "empty phone" do
			@company.phone = nil
			@company.save
			expect(@company.errors.messages[:phone][0]).to eq("can't be blank")
		end
	end
end
