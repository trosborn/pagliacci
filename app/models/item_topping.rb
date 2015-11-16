class ItemTopping < ActiveRecord::Base
  belongs_to :item
  belongs_to :topping
end
