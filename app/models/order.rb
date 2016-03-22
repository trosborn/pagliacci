class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items
  belongs_to :location
  accepts_nested_attributes_for :items
end
