class ToppingsController < ApplicationController
  before_action :set_topping, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @toppings = Topping.all
  end

  def new
    @topping = Topping.new
    authorize @topping, :new?
  end

  def show
  end

  def edit
    authorize @topping, :edit?
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
    authorize @topping, :create?
  end

  def update
    respond_to do |format|
      if @topping.update(topping_params)
        format.html { redirect_to @topping, notice: 'Topping was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
    authorize @topping, :update?
  end

  def destroy
    @topping.destroy
    respond_to do |format|
      format.html { redirect_to toppings_url, notice: 'Topping was successfully destroyed.' }
    end
    authorize @topping, :destroy?
  end

  private
  def topping_params
    params.require(:topping).permit(:name, :seasonal, :active)
  end

  def set_topping
    @topping = Topping.find(params[:id])
  end
end
