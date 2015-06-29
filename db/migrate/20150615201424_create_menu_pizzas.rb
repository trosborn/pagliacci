class CreateMenuPizzas < ActiveRecord::Migration
  def change
    create_table :menu_pizzas do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
