class MenuController < ApplicationController
  def index
    @menu_pizzas = Item.find_by_kind 'Pizza'
    @seasonal_pizzas = Item.find_seasonal_by_kind 'Pizza'
    @gelatos = Item.find_by_kind 'Gelato'
    @salads = Item.find_by_kind 'Salad'
    @beverages = Item.find_by_kind 'Beverage'
    @veggie_toppings = Item.toppings.where qualifier: 'Veggie', active: true
    @cheese_toppings = Item.toppings.where qualifier: 'Cheese', active: true
    @meat_toppings = Item.toppings.where qualifier: 'Meat', active: true
  end
end
