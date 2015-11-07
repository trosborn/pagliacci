class Salad < ActiveRecord::Base
  has_many :sizes
  has_many :salad_toppings
  has_many :toppings, through: :salad_toppings
  accepts_nested_attributes_for :sizes, :reject_if => :all_blank, allow_destroy: true
end
