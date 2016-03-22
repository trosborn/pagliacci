class Location < ActiveRecord::Base
  has_one :address, dependent: :destroy
  has_many :orders
  accepts_nested_attributes_for :address
end
