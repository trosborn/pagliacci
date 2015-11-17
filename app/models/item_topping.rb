class ItemTopping < ActiveRecord::Base
  belongs_to :item
  belongs_to :topping, class_name: 'Item'
end
