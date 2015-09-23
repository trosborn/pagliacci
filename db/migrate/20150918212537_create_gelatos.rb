class CreateGelatos < ActiveRecord::Migration
  def change
    create_table :gelatos do |t|
      t.string :name
      t.string :description
      t.boolean :dairy, default: false

      t.timestamps null: false
    end
  end
end
