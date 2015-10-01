class CreateSaladToppings < ActiveRecord::Migration
  def change
    create_table :salad_toppings do |t|
      t.integer :salad_id
      t.integer :topping_id

      t.timestamps null: false
    end
  end
end
