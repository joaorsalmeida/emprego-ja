class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :expiration_date
      t.string :job_status

      t.timestamps
    end
  end
end
