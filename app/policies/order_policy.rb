class OrderPolicy < ApplicationPolicy
  attr_reader :user, :order

  def add_item?
    user.customer?
  end

  def update_location?
    user.customer?
  end

  def complete?
    user.customer?
  end
end
