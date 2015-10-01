class SaladTopping < ActiveRecord::Base
  belongs_to :salad
  belongs_to :topping
end
