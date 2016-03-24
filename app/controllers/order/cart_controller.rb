class Order::CartController < Order::BaseController
  before_action :set_order

  def checkout
    if @order.location == nil
      redirect_to order_location_select_path
    end
  end

  def complete
    authorize @order
    @order.attributes = order_params
    if @order.update(order_params)
      redirect_to order_order_path(@order)
    end
  end

private
  def set_order
    @order = current_user.active_order
  end

  def order_params
    params.require(:order).permit(:location_id, :id, :completed)
  end
end
