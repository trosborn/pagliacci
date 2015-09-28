class AddLocationIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :location_id, :integer
  end
end
