class AddCompanyAdminRefToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :company_admin, index: true
  end
end
