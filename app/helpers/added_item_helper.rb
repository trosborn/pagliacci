module AddedItemHelper
  def added_item_to_order item
    if item.side_two == nil
      "Your #{item.selected_size_name.downcase} #{topping_names(item.side_one)} #{item.kind.downcase} has been added to your order"
    else
      "Your #{item.selected_size_name.downcase} one half #{topping_names(item.side_one)} other half #{topping_names(item.side_two)} #{item.kind.downcase} has been added to your order"
    end
  end

  def topping_names side
    side.toppings.pluck(:name).join(' ').downcase
  end
end
