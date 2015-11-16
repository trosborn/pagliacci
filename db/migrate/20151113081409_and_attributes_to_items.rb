class AndAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :seasonal, :boolean, :default => :false
    add_column :items, :active, :boolean, :default => :false
    add_column :items, :kind, :string
  end
end
