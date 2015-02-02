class AddCompanyRefToRecommendations < ActiveRecord::Migration
  def change
    add_reference :recommendations, :company, index: true
  end
end
