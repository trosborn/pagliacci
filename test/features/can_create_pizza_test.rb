require 'test_helper'

feature 'Admin Can Create Standard Pizza' do
  scenario 'as a site admin, I can create a Brooklyn Bridge' do
    visit menu_pizzas_path

    click_on 'Add New Pizza'
    fill_in 'Name', with: 'Brooklyn Bridge'

    fill_in 'Description', with: "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."

    click_on 'Create'

    page.must_have_content 'Brooklyn Bridge'
    page.must_have_content "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."
  end
  scenario 'as a site admin, I can add toppings to the Brooklyn Bridge' do
    test_pizza = menu_pizzas(:brooklyn_bridge)
    visit edit_menu_pizza_path test_pizza
    check 'pepperoni'
    check 'sausage'
    check 'mushroom'
    check 'onion'
    check 'green_pepper'
    check 'mozzarella'
    check 'red_sauce'

    click_on 'Create'

    page.must_have_content 'pepperoni'
    page.must_have_content 'sausage'
    page.must_have_content 'mushroom'
    page.must_have_content 'onion'
    page.must_have_content 'green pepper'
    page.must_have_content 'mozzarella'
    page.must_have_content 'red sauce'
  end
  scenario 'as a side admin, I can add prices for each size of pizza' do
    test_pizza = menu_pizzas(:brooklyn_bridge)
    visit edit_menu_pizza_path test_pizza

    fill_in 'Small price', with: 18.49
    fill_in 'Medium price', with: 22.49
    fill_in 'Large price', with: 25.99

    click_on 'Create'

    page.must_have_content '18.49'
    page.must_have_content '22.49'
    page.must_have_content '25.99'
  end
end
