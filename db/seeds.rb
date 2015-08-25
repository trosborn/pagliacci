25.times do MenuPizza.create(name: 'The Original',
  description: "Our signature cheese pizza made with whole-milk mozzarella and our seasoned tomato sauce on hand-tossed dough, baked on bricks.",
  small_price: 11.99, medium_price: 15.99, large_price: 18.99)
end

2.times do MenuPizza.create(name: 'Peachza Primo',
  description: "Layers of locally grown peaches, Italian cured pork loin and mozzarella over an olive oil base with fresh arugula and a drizzle of balsamic reduction after bake. You can also add peaches and pork loin as individual toppings to your favorite pizza.",
  small_price: 19.49, medium_price: 23.49, large_price: 26.99,
  seasonal: true, active: true
  )
end

260.times do MenuPizza.create(name: 'Hipster Primo',
  description: 'Artisanally handcrafted reclaimed cheese, from ethically sourced fair-trade local dumpsters. Topped with authentic Mexican corn fungus.',
  small_price: 19.99, medium_price: 23.99, large_price: 27.99,
  seasonal: true, active: false
  )
end

20.times do Topping.create(name: 'pepperoni')
end

2.times do Topping.create(name: 'peaches',
  seasonal: true, active: true
  )
end

260.times do Topping.create(name: 'pork loin',
  seasonal: true, active: false
  )
end

5.times do Salad.create(name: 'Sicilian Chicken Salad',
  description: "Mixed greens and arugula combined with chicken, thyme roasted artichokes, currants, sun-ripened tomatoes and kasseri cheese tossed in a spicy,
  vinaigrette.",
  small_price: 5.99, medium_price: 7.99, large_price: 11.99)
end
