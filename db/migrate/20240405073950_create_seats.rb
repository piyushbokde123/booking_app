class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.integer :seat_number
      t.boolean :available
      t.float :price
      t.references :show_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
