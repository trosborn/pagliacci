class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def add_item?
    user.customer?
  end
end
