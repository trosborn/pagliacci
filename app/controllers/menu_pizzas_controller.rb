class MenuPizzasController < ApplicationController
  before_action :set_menu_pizza, only: [:show, :edit, :update, :destroy]
  before_action :set_toppings, only: [:edit, :update]

  def index
    @menu_pizzas = MenuPizza.all
  end

  def new
    @menu_pizza = MenuPizza.new
  end

  def show
  end

  def edit
  end

  def create
    @menu_pizza = MenuPizza.new(menu_pizza_params)
    respond_to do |format|
      if @menu_pizza.save
        format.html { redirect_to @menu_pizza, notice: 'Topping was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @menu_pizza.attributes = {'topping_ids' => []}.merge(params[:menu_pizza] || {})
    respond_to do |format|
      if @menu_pizza.update(menu_pizza_params)
        format.html { redirect_to @menu_pizza, notice: 'Pizza was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  def set_toppings
    @toppings = Topping.all
  end

  def set_menu_pizza
    @menu_pizza = MenuPizza.find(params[:id])
  end

  def menu_pizza_params
    params.require(:menu_pizza).permit(:name, :description, :topping_ids, :small_price, :medium_price, :large_price)
  end
end