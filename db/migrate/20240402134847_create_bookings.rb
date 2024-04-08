class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :detail
      t.time :show_time
      t.integer :seats_no
      t.references :show_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
