class MenuController < ApplicationController
  def index
    @menu_pizzas = Item.find_by_kind 'Pizza'
    @seasonal_pizzas = Item.find_seasonal_by_kind 'Pizza'
    @gelatos = Item.find_by_kind 'Gelato'
    @salads = Item.find_by_kind 'Salad'
    @beverages = Item.find_by_kind 'Beverage'
    @veggie_toppings = Topping.where('veggie IS true AND active IS true')
    @cheese_toppings = Topping.where('cheese IS true AND active IS true')
    @meat_toppings = Topping.where('meat IS true AND active IS true')
  end
end
