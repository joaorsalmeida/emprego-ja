class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :fantasy_name
      t.integer :cnpj
      t.string :url
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
