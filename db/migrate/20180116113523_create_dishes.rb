class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.integer :menus_appeared
      t.integer :times_appeared
      t.integer :first_appeared
      t.integer :last_appeared
      t.integer :lowest_price
      t.integer :highest_price
      t.timestamps
    end
  end
end
