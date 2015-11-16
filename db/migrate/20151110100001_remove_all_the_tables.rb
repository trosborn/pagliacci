class RemoveAllTheTables < ActiveRecord::Migration
  def change
    drop_table :beverages
    drop_table :menu_pizzas
    drop_table :gelatos
    drop_table :pizza_toppings
    drop_table :salad_toppings
  end
end
