class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:add_item]
  after_action :verify_authorized, except: [:home, :add_item, :create]

  def home
    @menu_pizzas = Item.find_by_kind 'Pizza'
  end

  def index
    @orders = current_user.orders
  end

  def show
  end

  def add_item
    @toppings = Item.toppings
    @order = current_user.orders.find_or_create_by completed: false
  end

  def edit
  end

private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:completed, :special_instructions,
      items_attributes: { topping_ids: [] })
  end
end
