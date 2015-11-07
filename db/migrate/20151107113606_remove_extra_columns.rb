class RemoveExtraColumns < ActiveRecord::Migration
  def change
    remove_column :salads, :small_price
    remove_column :salads, :large_price
    remove_column :salads, :medium_price
    remove_column :gelatos, :other_size
  end
end
