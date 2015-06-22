require 'test_helper'

feature 'Admin Can Create Standard Pizza' do
  scenario 'as a site admin, I can create a Brooklyn Bridge' do
    visit menu_pizzas_path

    click_on 'Add New Pizza'
    fill_in 'Name', with: 'Brooklyn Bridge'

    fill_in 'Description', with: "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."

    click_on 'Add Toppings'

    page.must_have_content 'Brooklyn Bridge'
    page.must_have_content "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."
  end
  scenario 'as a site admin, I can add default toppings to the Brooklyn Bridge' do
    click_on 'Add Topping'
    select 'Pepperoni', from: 'Topping 1'
    click_on 'Add Topping'
    select 'Sausage', from: 'Topping 2'
    click_on 'Add Topping'
    select 'Mushroom', from: 'Topping 3'
    click_on 'Add Topping'
    select 'Onion', from: 'Topping 4'
    click_on 'Add Topping'
    select 'Green Pepper', from: 'Topping 5'
    click_on 'Add Topping'
    select 'Mozarella', from: 'Toping 6'
    click_on 'Add Topping'
    select 'Red Sauce', from: 'Topping 7'
    click_on 'Add Topping'

    page.must_have_content 'Pepperoni'
    page.must_have_content 'Sausage'
    page.must_have_content 'Mushroom'
    page.must_have_content 'Onion'
    page.must_have_content 'Green Pepper'
    page.must_have_content 'Mozarella'
    page.must_have_content 'Red Sauce'
  end
  scenario 'as a site admin, a pizza I create requires a name' do
    visit menu_pizzas_path

    click_on 'Add New Pizza'

    click_on 'Add Toppings'

    page.must_have_content 'Pizza Could Not Be Saved: Pizza Requires a Name'
  end
end
