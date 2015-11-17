class CreateToppings < ActiveRecord::Migration
  def change
    add_reference :items, :toppings, index: true
  end
end
