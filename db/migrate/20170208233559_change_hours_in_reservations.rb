class ChangeHoursInReservations < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :hours, :hour
  end
end
