class MenuPizzaPolicy < ApplicationPolicy
  attr_reader :user

  def initialize user, menu_pizza
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
