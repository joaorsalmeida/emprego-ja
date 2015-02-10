class AddDataToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :name, :text
    add_column :job_applications, :resume, :text
    add_column :job_applications, :jobs, :text
    add_column :job_applications, :school, :text
    add_column :job_applications, :salary, :integer
  end
end
