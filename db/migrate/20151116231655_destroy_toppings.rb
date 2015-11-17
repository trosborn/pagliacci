class DestroyToppings < ActiveRecord::Migration
  def change
    drop_table :toppings
  end
end
