class AddHalfPriceToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :half_price, :float
  end
end
