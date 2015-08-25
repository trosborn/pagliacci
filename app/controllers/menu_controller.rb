class MenuController < ApplicationController
  def index
    @menu_pizzas = MenuPizza.where('seasonal IS NOT true')
    @seasonal_pizzas = MenuPizza.where('seasonal IS true AND active IS true')
    @salads = Salad.all
    @menu_toppings = Topping.where('seasonal IS NOT true')
    @seasonal_toppings = Topping.where('seasonal IS true AND active IS true')
  end

  def show
  end
end
