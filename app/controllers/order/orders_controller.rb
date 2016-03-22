class Order::OrdersController < Order::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:add_item]
  after_action :verify_authorized, except: [:home]

  def home
    @menu_pizzas = Item.find_by_kind 'Pizza'
    @seasonal_pizzas = Item.find_seasonal_by_kind 'Pizza'
    @gelatos = Item.find_by_kind 'Gelato'
    @salads = Item.find_by_kind 'Salad'
    @beverages = Item.find_by_kind 'Beverage'
  end

  def index
    @orders = current_user.orders
  end

  def show
  end

  def add_item
    @whole_pie = @item
    @toppings = Item.toppings
    @order = current_user.orders.find_or_create_by completed: false
    authorize @order
  end

  def added_item
    @item = User.active_order.items.last
    authorize @item
  end

  def

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