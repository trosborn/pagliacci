class AddActiveToGelatos < ActiveRecord::Migration
  def change
    add_column :gelatos, :active, :boolean
  end
end
