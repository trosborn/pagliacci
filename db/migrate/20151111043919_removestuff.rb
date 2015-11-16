class Removestuff < ActiveRecord::Migration
  def change
    remove_column :items, :pizza_id
    remove_column :items, :topping_id
  end
end
