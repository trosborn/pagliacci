class DropSaladsTable < ActiveRecord::Migration
  def change
    rename_table :salads, :items
  end
end
