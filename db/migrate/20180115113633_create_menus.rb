class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name, :citext
      t.string :sponsor
      t.string :event, :citext
      t.string :venue, :citext
      t.string :place, :citext
      t.string :physical_description, :citext
      t.string :occasion, :citext
      t.string :notes, :citext
      t.string :call_number, :citext
      t.string :keywords, :citext
      t.string :language, :citext
      t.date :date
      t.string :location, :citext
      t.string :location_type
      t.string :currency, :citext
      t.string :currency_symbol, :citext
      t.string :status, :citext
      t.integer :page_count
      t.integer :dish_count
      t.timestamps
    end
  end
end
