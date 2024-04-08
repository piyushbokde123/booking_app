class AddFieldsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :price, :float
    add_column :bookings, :seat_number, :text, array: true, default: []
    add_reference :bookings, :user, null: false, foreign_key: true
  end
end
