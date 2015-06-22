class PizzaTopping < ActiveRecord::Base
  belongs_to :menu_pizza
  belongs_to :topping
end
