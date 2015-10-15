class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.string :name
      t.string :description
      t.decimal :single_price
      t.decimal :six_price

      t.timestamps null: false
    end
  end
end
