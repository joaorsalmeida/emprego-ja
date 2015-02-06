require 'rails_helper'

RSpec.describe JobPositionsController, :type => :controller do
	let (:company) {Company.create!({:fantasy_name => "nome teste 2", :cnpj => 50304411000149, :url => "www.teste", :email => "emo@eu.com", :phone => "99929999"})}
	describe "user authentication" do
		before do
			@user = User.create!({
				email: "diego@tete.com",
				password:  "inicial1234",
				password_confirmation: "inicial1234"
				})
			sign_in @user
		end
		it 'index success' do
			get :index, company_id: company
			expect(response).to have_http_status(:success)
		end
		it 'new failed' do
			get :new, company_id: company
			expect(response).to	have_http_status(302)
		end
	end
end