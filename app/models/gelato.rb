class Gelato < ActiveRecord::Base
  validates :name, presence: true
end
