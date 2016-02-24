class AddSpecialIntructionsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :special_instructions, :string
  end
end
