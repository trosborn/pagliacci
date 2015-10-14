["Arugula", "Basil", "Fresh Garlic", "Roasted Garlic", "Green Peppers",
  "Imported Peppers", "Jalapeños", "Kalamata Olives", "Mama
  Lil’s Peppers", "Ostrom's Mushrooms", "Olives", "Onions", "Pesto",
  "Pineapple", "Red Onions", "Spinach", "Fresh Tomatoes",
  "Sun-Ripened Tomatoes", "Thyme-Roasted Artichoke Hearts"].each do |t|
  Topping.create(name: "#{t}", veggie: true)
end

["Feta", "Fontina", "Laura", "Chenel's Goat Cheese", "Gorgonzola",
  "Extra Mozzarella", "Fresh Mozzarella", "Ricotta"].each do |t|
  Topping.create(name: "#{t}", cheese: true)
end

["Anchovies", "Hempler's Canadian Bacon", "Marinated Chicken",
  "Isernio's Chicken Sausage", "Cascioppo Bros Italian Sausage",
  "Pepperoni", "La Quercia Prosciutto", "Salami", "Salumi's Spicy Pepperoni"].each do |m|
  Topping.create(name: "#{m}", meat: true)
end

25.times do MenuPizza.create(name: 'The Original',
  description: "Our signature cheese pizza made with whole-milk mozzarella and our seasoned tomato sauce on hand-tossed dough, baked on bricks.",
  small_price: 11.99, medium_price: 15.99, large_price: 18.99, :topping_ids =>['1', '2', '5'])
end

MenuPizza.create(name: 'Peachza Primo',
  description: "Layers of locally grown peaches, Italian cured pork loin and mozzarella over an olive oil base with fresh arugula and a drizzle of balsamic reduction after bake.
  You can also add peaches and pork loin as individual toppings to your favorite pizza.",
  small_price: 19.49, medium_price: 23.49, large_price: 26.99,
  seasonal: true, active: true, :topping_ids =>['1', '2', '4'])

MenuPizza.create(name: 'Matador Primo',
  description: "Featuring La Quercia 'nduja, Castelvetrano olives, Manchego cheese and fresh mozzarella over a crushed Italian tomato base.
  Castelvetrano olives will also be available as a topping for any of your other favorite pizzas."
  small_price: 21.99, medium_price: 23.99, large_price: 27.99, seasonal: true, active: true)

Salad.create(name: 'Sicilian Chicken Salad',
  description: "Mixed greens and arugula combined with chicken, thyme roasted artichokes, currants, sun-ripened tomatoes and kasseri cheese tossed in a spicy,
  vinaigrette.",
  small_price: 6.99, medium_price: 7.99, large_price: 11.99)

Salad.create(name: 'Pagliaccio Salad',
  description: 'Green leaf lettuce tossed with garbanzo beans, diced red peppers, kasseri cheese, salami, red onions and our Dijon vinaigrette.',
  small_price: 5.49, medium_price: 7.49, large_price: 10.49)

Salad.create(name: 'Caesar Salad',
  description: "Romaine lettuce tossed with Parmesan, croutons handmade by Macrina Bakery and our Caesar dressing.",
  small_price: 5.49, medium_price: 7.49, large_price: 10.49)

Salad.create(name: 'Pesto Salad',
  description: "Pasta, sweet peas, and thyme-roasted artichoke hearts tossed with creamy pesto dressing.",
  small_price: 6.99, medium_price: 8.99, large_price: 10.49)

Gelato.create(name: 'Panna', description: "Vanilla. Duh.", dairy: true)
Gelato.create(name: 'Lemon', description: "No one orders this shit", dairy: false)


