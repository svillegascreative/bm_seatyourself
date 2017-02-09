class AddColumnsToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :year, :string
    add_column :reservations, :month, :string
    add_column :reservations, :day, :string
    add_column :reservations, :hours, :string
  end
end
