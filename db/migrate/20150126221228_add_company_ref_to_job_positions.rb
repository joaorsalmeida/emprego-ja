class AddCompanyRefToJobPositions < ActiveRecord::Migration
  def change
    add_reference :job_positions, :company, index: true
  end
end
