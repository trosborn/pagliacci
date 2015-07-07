class AddLargeSizeToMenuPizzas < ActiveRecord::Migration
  def change
    add_column :menu_pizzas, :small_price, :decimal, :precision => 4, :scale => 2
    add_column :menu_pizzas, :medium_price, :decimal, :precision => 4, :scale => 2
    add_column :menu_pizzas, :large_price, :decimal, :precision => 4, :scale => 2
  end
end
