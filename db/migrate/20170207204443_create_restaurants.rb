class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.integer :capacity
      t.integer :phone
      t.text :description
      t.string :website
      t.integer :owner_id
      t.integer :category_id

      t.timestamps
    end
  end
end
