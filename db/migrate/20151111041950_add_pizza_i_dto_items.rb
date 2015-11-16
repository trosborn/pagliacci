class AddPizzaIDtoItems < ActiveRecord::Migration
  def change
    add_column :items, :pizza_id, :integer
  end
end
