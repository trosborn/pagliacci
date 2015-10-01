class Salad < ActiveRecord::Base
  has_many :salad_toppings
  has_many :toppings, through: :salad_toppings
end
