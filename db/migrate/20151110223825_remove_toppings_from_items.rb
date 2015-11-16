class RemoveToppingsFromItems < ActiveRecord::Migration
  def change
    remove_foreign_key :items, :toppings
  end
end
