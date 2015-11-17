class MenuController < ApplicationController
  def index
    @menu_pizzas = Item.find_by_kind 'Pizza'
    @seasonal_pizzas = Item.find_seasonal_by_kind 'Pizza'
    @gelatos = Item.find_by_kind 'Gelato'
    @salads = Item.find_by_kind 'Salad'
    @beverages = Item.find_by_kind 'Beverage'
    @veggie_toppings = Item.where("kind = 'Topping'")
    @cheese_toppings = Item.where("kind = 'Topping'")
    @meat_toppings = Item.where('active IS true')
  end
end
