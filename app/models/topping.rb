class Topping < ActiveRecord::Base
  has_many :item_toppings
  has_many :items, through: :item_topping
end
