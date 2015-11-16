class AddToppingReferencesToItems < ActiveRecord::Migration
  def change
    add_reference :items, :topping, index: true
    add_foreign_key :items, :toppings
  end
end
