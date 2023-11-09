class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :week_date, null: false
      t.string :hour, null: false
      t.string :team, null: false

      t.timestamps
    end
  end
end
