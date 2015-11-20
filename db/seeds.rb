["Arugula", "Basil", "Fresh Garlic", "Roasted Garlic", "Green Peppers",
  "Imported Peppers", "Jalapeños", "Kalamata Olives", "Mama
  Lil’s Peppers", "Ostrom's Mushrooms", "Olives", "Onions", "Pesto",
  "Pineapple", "Red Onions", "Spinach", "Fresh Tomatoes",
  "Sun-Ripened Tomatoes", "Thyme-Roasted Artichoke Hearts"].each do |t|
  Item.create(name: "#{t}", active: true, seasonal: false, kind: 'Topping', qualifier: 'Veggie')
end

["Feta", "Fontina", "Laura Chenel's Goat Cheese", "Gorgonzola",
  "Extra Mozzarella", "Fresh Mozzarella", "Ricotta"].each do |t|
  Item.create(name: "#{t}", active: true, seasonal: false, qualifier: 'Cheese', kind: 'Topping')
end

["Anchovies", "Hempler's Canadian Bacon", "Marinated Chicken",
  "Isernio's Chicken Sausage", "Cascioppo Bros Italian Sausage",
  "Pepperoni", "La Quercia Prosciutto", "Salami", "Salumi's Spicy Pepperoni"].each do |t|
  Item.create(name: "#{t}", active: true, seasonal: false, qualifier: 'Meat', kind: 'Topping')
end

25.times do Item.create(name: 'The Original',
  description: "Our signature cheese pizza made with whole-milk mozzarella and our seasoned tomato sauce on hand-tossed dough, baked on bricks.",
  topping_ids: ['1', '2', '5'],
  "sizes_attributes"=>
  {"1447877840468"=>{"name"=>"Small", "price"=>"18.99", "_destroy"=>"false"},
  "1447877847682"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"},
  "1447877840479"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
  active: true,
  kind: 'Pizza')
end

Item.create(name: 'Peachza Primo',
  description: "Layers of locally grown peaches, Italian cured pork loin and mozzarella over an olive oil base with fresh arugula and a drizzle of balsamic reduction after bake.
  You can also add peaches and pork loin as individual toppings to your favorite pizza.",
  seasonal: true, topping_ids: ['1', '2', '4'], "sizes_attributes"=>{"1447877840428"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "1447877847382"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840419"=>{"name"=>"Large",
      "price"=>"22.29","_destroy"=>"false"}},
      active: true,
      kind: 'Pizza')

Item.create(name: 'Matador Primo',
  description: "Featuring La Quercia 'nduja, Castelvetrano olives, Manchego cheese and fresh mozzarella over a crushed Italian tomato base.
  Castelvetrano olives will also be available as a topping for any of your other favorite pizzas.",
    "sizes_attributes"=>{"1447877840486"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "1447877847621"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840412"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
    active: true,
    seasonal: true,
    kind: 'Pizza')

Item.create(name: 'Sicilian Chicken',
  description: "Mixed greens and arugula combined with chicken, thyme roasted artichokes, currants, sun-ripened tomatoes and kasseri cheese tossed in a spicy,
  vinaigrette.",
  "sizes_attributes"=>{"1447877840499"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "144787784999"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840974"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
    active: true,
    kind: 'Salad')

Item.create(name: 'Pagliaccio',
  description: 'Green leaf lettuce tossed with garbanzo beans, diced red peppers, kasseri cheese, salami, red onions and our Dijon vinaigrette.',
  "sizes_attributes"=>{"1447877840429"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "1447877847687"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840379"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
    active: true,
    kind: 'Salad')

Item.create(name: 'Caesar',
  description: "Romaine lettuce tossed with Parmesan, croutons handmade by Macrina Bakery, and our Caesar dressing.",
  "sizes_attributes"=>{"1447877840568"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "1447877847782"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840879"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
    active: true,
    kind: 'Salad')

Item.create(name: 'Pesto',
  description: "Pasta, sweet peas, and thyme-roasted artichoke hearts tossed with creamy pesto dressing.",
  "sizes_attributes"=>{"1447877840445"=>{"name"=>"Small", "price"=>"18.99",
    "_destroy"=>"false"}, "1447877847646"=>{"name"=>"Medium", "price"=>"20.59", "_destroy"=>"false"}, "1447877840447"=>{"name"=>"Large", "price"=>"22.29","_destroy"=>"false"}},
    active: true,
    kind: 'Salad')

['Sweet Cream (Panna)', 'Chocolate', 'Chocolate Chip Mint','Salted Caramel', 'Lemon', 'Raspberry'].each do |g|
  Item.create(name: "#{g}", kind: 'Gelato', active: true)
end
