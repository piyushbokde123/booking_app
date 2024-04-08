class ChangeColumnToBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :show_time, :show_timing
    rename_column :bookings, :seats_no, :total_seats
    add_reference :bookings, :movie, null: false, foreign_key: true
  end
end
