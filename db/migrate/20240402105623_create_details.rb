class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.string :movie
      t.date :show_time
      t.integer :seat_no
      t.references :show_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
