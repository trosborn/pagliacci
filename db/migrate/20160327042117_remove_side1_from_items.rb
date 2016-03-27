class RemoveSide1FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :side1
  end
end
