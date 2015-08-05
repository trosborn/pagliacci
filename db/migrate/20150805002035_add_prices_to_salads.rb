class AddPricesToSalads < ActiveRecord::Migration
  def change
    add_column :salads, :small_price, :decimal, :precision => 4, :scale => 2
    add_column :salads, :medium_price, :decimal, :precision => 4, :scale => 2
    add_column :salads, :large_price, :decimal, :precision => 4, :scale => 2
  end
end
