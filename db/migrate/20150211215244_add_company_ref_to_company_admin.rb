class AddCompanyRefToCompanyAdmin < ActiveRecord::Migration
  def change
    add_reference :company_admins, :company, index: true
  end
end
