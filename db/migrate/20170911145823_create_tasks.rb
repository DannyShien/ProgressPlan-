class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_tasks do |t|
      t.string :title
      t.date :completed

      t.timestamps
    end
  end
end
