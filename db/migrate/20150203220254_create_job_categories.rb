class CreateJobCategories < ActiveRecord::Migration
  def change
    create_table :job_categories do |t|
    	 t.string :decription
      t.timestamps
    end
  end
end
