class AddCategoriesToJobPosition < ActiveRecord::Migration
  def change
  	add_reference :job_positions, :job_categories, index: true
  end
end
