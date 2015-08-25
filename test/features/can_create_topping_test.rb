require 'test_helper'

feature 'Admin Can Create Topping' do
  scenario 'as an admin, I want to create ricotta as a pizza topping' do
    visit toppings_path

    click_on 'Create Pizza Topping'
    fill_in 'Name', with: 'ricotta'

    click_on 'Create'

    page.must_have_content 'Name: Ricotta'
  end
  scenario 'as an admin, I want to set a topping as seasonal and active' do
    test_topping = toppings(:pepperoni)
    visit topping_path test_topping

    click_on 'Edit'

    check 'topping[active]'
    check 'topping[seasonal]'

    click_on 'Create'

    page.must_have_content 'Active'
    page.must_have_content 'Seasonal'
  end
end
