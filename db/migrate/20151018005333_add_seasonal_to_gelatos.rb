class AddSeasonalToGelatos < ActiveRecord::Migration
  def change
    add_column :gelatos, :seasonal, :boolean
  end
end
