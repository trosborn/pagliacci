class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
  end

  def new
    @topping = Topping.new
  end

  def show
    @topping = Topping.find(params[:id])
  end

  def create
    @topping = Topping.new(topping_params)
    respond_to do |format|
      if @topping.save
        format.html { redirect_to @topping, notice: 'Topping was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def topping_params
    params.require(:topping).permit(:name)
  end
end
