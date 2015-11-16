class CreateItemToppings < ActiveRecord::Migration
  def change
    create_table :item_toppings do |t|
      t.integer :item_id
      t.integer :topping_id

      t.timestamps null: false
    end
  end
end
