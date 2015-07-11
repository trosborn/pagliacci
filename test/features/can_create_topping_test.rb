require 'test_helper'

feature 'Admin Can Create Topping' do
  scenario 'as an admin, I want to create ricotta as a pizza topping' do
    visit toppings_path

    click_on 'Create Pizza Topping'
    fill_in 'Name', with: 'ricotta'

    click_on 'Create Topping'

    page.must_have_content 'Name: Ricotta'
  end
end
