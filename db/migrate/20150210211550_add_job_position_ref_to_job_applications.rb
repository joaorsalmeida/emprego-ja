class AddJobPositionRefToJobApplications < ActiveRecord::Migration
  def change
    add_reference :job_applications, :job_position, index: true
  end
end
