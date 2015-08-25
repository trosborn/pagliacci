class AddSeasonalToMenuPizzas < ActiveRecord::Migration
  def change
    add_column :menu_pizzas, :seasonal, :boolean, default: false
    add_column :menu_pizzas, :active, :boolean, default: false
  end
end
