class Item < ActiveRecord::Base
  belongs_to :order
  has_many :sizes
  has_many :item_toppings
  has_many :toppings, through: :item_toppings
  has_many :inverse_item_toppings, class_name: 'ItemTopping', foreign_key: 'item_id'
  has_many :inverse_toppings, through: :inverse_item_toppings, source: :item
  accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true

  def self.find_by_kind query
    where kind: query, seasonal: false, active: true
  end

  def self.find_seasonal_by_kind query
    where kind: query, seasonal: true, active: true
  end

  def self.toppings
    where kind: 'Topping'
  end

  def size_selection= val
    sizes.build(name: Size.find_by_id(val).name)
  end
end
