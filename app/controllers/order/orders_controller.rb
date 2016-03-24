class Order::OrdersController < Order::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :location_select, :update_location]
  before_action :set_item, only: [:add_item, :location]
  after_action :verify_authorized, except: [:home, :location_select, :location_selected]

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
    authorize @order
  end

  def add_item
    @whole_pie = @item
    @toppings = Item.toppings
    @order = current_user.orders.find_or_create_by completed: false
    authorize @order
  end

  def added_item
    @item = current_user.active_order.items.last
    authorize @item
  end

  def location_select
  end

  def update_location
    @order.attributes = order_params
    authorize @order
    if @order.save!
      redirect_to order_location_selected_path
    end
  end

  def location_selected
    @location = current_user.active_order.location
  end

  def edit
  end

private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    if params[:id]
      @order = Order.find(params[:id])
    else
      @order = current_user.active_order
    end
  end

  def order_params
    params.require(:order).permit(:completed, :special_instructions, :location_id,
      items_attributes: { topping_ids: [] })
  end
end
