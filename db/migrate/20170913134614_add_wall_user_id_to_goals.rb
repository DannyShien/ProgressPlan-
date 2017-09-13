class AddWallUserIdToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :wall_user_id, :integer
  end
end
