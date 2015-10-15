json.array!(@beverages) do |beverage|
  json.extract! beverage, :id, :name, :description, :single_price, :six_price
  json.url beverage_url(beverage, format: :json)
end
