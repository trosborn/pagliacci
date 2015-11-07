class AddSaladIdToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :salad_id, :integer
  end
end
