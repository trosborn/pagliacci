class AddDescriptionToSalads < ActiveRecord::Migration
  def change
    add_column :salads, :description, :string
  end
end
