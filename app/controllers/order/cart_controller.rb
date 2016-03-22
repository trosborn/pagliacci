class Order::CartController < Order::BaseController
  before_action :set_order

  def checkout
  end

  def review
    @order.attributes = order_params
  end

private
  def set_order
    @order = User.active_order
  end

  def order_params
    params.require(:order).permit(:location_id)
  end
end
