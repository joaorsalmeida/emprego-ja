class AddAddressFieldToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :address, :string
  end
end
