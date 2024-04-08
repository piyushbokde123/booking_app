class ChangeFieldToShowTims < ActiveRecord::Migration[7.1]
  def change
    rename_column :show_times, :seats, :seat_count
    add_column :show_times, :date, :date
  end
end
