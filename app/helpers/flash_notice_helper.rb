module FlashNoticeHelper
  def add_item_to_order item
    side_1_topping_names = item.sides.first.toppings.pluck(:name).join(' ').downcase
    side_2 = item.sides.try(:second)
    if side_2 != nil
      side_2_topping_names = side_2.toppings.pluck(:name).join(' ').downcase
    else
      side_2_topping_names = nil
    end
    if side_2_topping_names == nil
      "Your #{item.sizes.first.name.downcase} #{side_1_topping_names} #{item.kind.downcase} has been added to your order"
    else
      "Your #{item.sizes.first.name.downcase} one half #{side_1_topping_names} other half #{side_2_topping_names} has been added to your order"
    end
  end
end
