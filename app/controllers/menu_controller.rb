class MenuController < ApplicationController
  def index
    @menu_pizzas = MenuPizza.where('seasonal IS NOT true')
    @seasonal_pizzas = MenuPizza.where('seasonal IS true AND active IS true')
    @gelatos = Gelato.all
    @salads = Salad.all
    @veggie_toppings = Topping.where('veggie IS true AND active IS true')
    @cheese_toppings = Topping.where('cheese IS true AND active IS true')
    @meat_toppings = Topping.where('meat IS true AND active IS true')
  end
end
