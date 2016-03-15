class ItemPolicy < ApplicationPolicy
  attr_reader :user, :item

  def initialize user, item
    @user = user || NullUser.new
    @item = item
  end

  def admin_create?
    user.admin?
  end

  def admin_new?
    user.admin?
  end

  def admin_edit?
    user.admin?
  end

  def admin_update?
    user.admin?
  end

  def admin_destroy?
    user.admin?
  end

  def create?
    user.customer?
  end

  def new?
    user.customer?
  end

  def update?
    user.customer?
  end

  def destroy?
    user.customer
  end
end
