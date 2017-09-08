class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :note
      t.date :completed

      t.timestamps
    end
  end
end
