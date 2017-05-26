class AddTotalPoints < ActiveRecord::Migration
  def change
    add_column :volunteers, :total_points, :integer
  end
end
