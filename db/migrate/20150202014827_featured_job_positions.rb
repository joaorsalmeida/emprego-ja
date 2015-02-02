class FeaturedJobPositions < ActiveRecord::Migration
  def change
    add_column :job_positions, :featured, :boolean , :default => false
  end
end
