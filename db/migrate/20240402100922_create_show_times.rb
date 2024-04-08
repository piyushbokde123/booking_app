class CreateShowTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :show_times do |t|
      t.time :start_time
      t.integer :seats
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
