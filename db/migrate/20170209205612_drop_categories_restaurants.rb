class DropCategoriesRestaurants < ActiveRecord::Migration[5.0]
  def change
    drop_table :categories_restaurants
  end
end
