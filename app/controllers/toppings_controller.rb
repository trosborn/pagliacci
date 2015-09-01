class ToppingsController < ApplicationController
  before_action :set_topping, only: [:show, :edit, :update, :destroy]

  def index
    @toppings = Topping.all
  end

  def new
    @topping = Topping.new
  end

  def show
  end

  def edit
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

  def update
    respond_to do |format|
      if @topping.update(topping_params)
        format.html { redirect_to @topping, notice: 'Topping was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @topping.destroy
    respond_to do |format|
      format.html { redirect_to toppings_url }
    end
  end

  private
  def topping_params
    params.require(:topping).permit(:name, :seasonal, :active)
  end

  def set_topping
    @topping = Topping.find(params[:id])
  end
end
