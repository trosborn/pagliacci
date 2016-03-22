class AddLocationToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :location_id, :integer
  end
end
