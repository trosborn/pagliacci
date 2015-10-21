module MenuHelper
  def add_commas_to_product products
    products.pluck(:name).join ', '
  end
end
