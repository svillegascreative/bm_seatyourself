class ChangePhoneTypeInRestaurants < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :phone, :string
  end
end
