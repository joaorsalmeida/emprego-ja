class AddCategoriesToJobPosition < ActiveRecord::Migration
  def change
  	add_reference :job_positions, :job_category, index: true
  end
end
