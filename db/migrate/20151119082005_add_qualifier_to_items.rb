class AddQualifierToItems < ActiveRecord::Migration
  def change
    add_column :items, :qualifier, :string
  end
end
