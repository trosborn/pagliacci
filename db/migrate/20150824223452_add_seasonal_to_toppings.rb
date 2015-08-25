class AddSeasonalToToppings < ActiveRecord::Migration
  def change
    add_column :toppings, :seasonal, :boolean, default: false
    add_column :toppings, :active, :boolean, default: false
  end
end
