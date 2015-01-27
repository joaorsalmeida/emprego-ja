class AddJobPositionRefToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :job_position, index: true
  end
end
