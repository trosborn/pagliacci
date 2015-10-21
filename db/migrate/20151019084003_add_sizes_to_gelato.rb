class AddSizesToGelato < ActiveRecord::Migration
  def change
    add_column :gelatos, :other_size, :integer
  end
end
