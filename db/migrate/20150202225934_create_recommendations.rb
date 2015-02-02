class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :email
      t.text :recommend

      t.timestamps
    end
  end
end
