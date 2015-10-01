class Topping < ActiveRecord::Base
  has_many :menu_pizzas, through: :pizza_toppings
  has_many :salads, through: :salad_topping
  has_many :pizza_toppings
end
