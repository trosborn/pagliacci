class MenuPizza < ActiveRecord::Base
  has_many :pizza_toppings
  has_many :toppings, through: :pizza_toppings
  validates :name, presence: true
end
