class DropTypeFromToppings < ActiveRecord::Migration
  def change
    remove_column :toppings, :type
    add_column :toppings, :meat, :boolean
    add_column :toppings, :veggie, :boolean
    add_column :toppings, :cheese, :boolean
  end
end
