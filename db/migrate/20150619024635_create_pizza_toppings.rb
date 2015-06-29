class CreatePizzaToppings < ActiveRecord::Migration
  def change
    create_table :pizza_toppings do |t|
      t.belongs_to :menu_pizza, index: true
      t.belongs_to :topping, index: true

      t.timestamps null: false
    end
  end
end
