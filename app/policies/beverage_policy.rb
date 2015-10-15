class BeveragePolicy < ApplicationPolicy
  attr_reader :user

  def initialize user, beverage
    @user = user || NullUser.new
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
