module MenuHelper
  def add_commas_to_product products
    products.pluck(:name).join ', '
  end

  def add_bullets_to_sizes sizes
    sizes.pluck(:price).join '•'
  end
end
