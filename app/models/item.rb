class Item < ActiveRecord::Base
  has_many :sizes
  has_many :item_toppings
  has_many :toppings, through: :item_toppings
  has_many :inverse_item_toppings, class_name: 'ItemTopping', foreign_key: 'item_id'
  has_many :inverse_toppings, :through => :inverse_item_toppings, :source => :item
  accepts_nested_attributes_for :sizes, :reject_if => :all_blank, allow_destroy: true

  def self.find_by_kind query
    Item.where "kind = '#{query}' AND seasonal IS false"
  end

  def self.find_seasonal_by_kind query
    Item.where "kind = '#{query}' AND seasonal IS true AND active IS true"
  end
end
