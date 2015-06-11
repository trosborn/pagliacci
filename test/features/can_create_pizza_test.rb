require 'test_helper'

feature 'Admin Can Create Pizza' do
  scenario 'as a site admin, I can create a Brooklyn Bridge' do
    visit pizzas_path

    click_on 'Create Pizza'
    fill_in 'name', with: 'Brooklyn Bridge'


    select 'Pepperoni', from: 'Topping 1'
    select 'Sausage', from: 'Topping 2'
    select 'Mushroom', from: 'Topping 3'
    select 'Onion', from: 'Topping 4'
    select 'Green Pepper', from: 'Topping 5'
    select 'Mozarella', from: 'Toping 6'
    select 'Red Sauce', from: 'Topping 7'

    click_on 'Create Pizza'

    page.must_have_content 'Pepperoni'
    page.must_have_content 'Sausage'
    page.must_have_content 'Mushroom'
    page.must_have_content 'Onion'
    page.must_have_content 'Green Pepper'
    page.must_have_content 'Mozarella'
    page.must_have_content 'Red Sauce'
  end
end
