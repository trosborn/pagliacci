class RenameSaladId < ActiveRecord::Migration
  def change
    rename_column :sizes, :salad_id, :item_id
  end
end
