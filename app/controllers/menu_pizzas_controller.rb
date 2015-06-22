class MenuPizzasController < ApplicationController
  def index
    @menu_pizzas
  end

  def new
    @menu_pizza = MenuPizza.new
  end

  def show
    @menu_pizza = MenuPizza.find(params[:id])
    @toppings = Topping.all
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
    @menu_pizza = MenuPizza.find(params[:id])
    respond_to do |format|
      if @menu_pizza.update(post_params)
        format.html { redirect_to @menu_pizza, notice: 'Pizza was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  def menu_pizza_params
    params.require(:menu_pizza).permit(:name, :description)
  end
end
