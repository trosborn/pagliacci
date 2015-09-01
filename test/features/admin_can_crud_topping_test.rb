require 'test_helper'

feature 'Admin Can Create Topping' do
  scenario 'as a site admin, I can view a topping' do
    test_topping = toppings(:pepperoni)
    visit topping_path test_topping

    page.must_have_content 'Pepperoni'
  end
  scenario 'as an admin, I want to create ricotta as a pizza topping' do
    visit toppings_path

    click_on 'Create Pizza Topping'
    fill_in 'Name', with: 'ricotta'
    check 'topping[active]'
    check 'topping[seasonal]'

    click_on 'Create'

    page.must_have_content 'Name: Ricotta'
    page.must_have_content 'Active'
    page.must_have_content 'Seasonal'
  end
  scenario 'as an admin, I want to edit a topping' do
    test_topping = toppings(:pepperoni)
    visit topping_path test_topping
    click_on 'Edit'

    fill_in 'Name', with: 'spicy pepp'
    check 'topping[active]'
    uncheck 'topping[seasonal]'

    click_on 'Update'

    page.must_have_content 'Spicy pepp'
    page.must_have_content 'Active'
    page.wont_have_content 'Seasonal'
    page.wont_have_content 'pepperoni'
  end
  scenario 'as a site admin, I want to delete a topping' do
    test_topping = toppings(:sausage)
    visit topping_path test_topping

    click_on 'Edit'
    click_on 'Delete'

    page.wont_have_content 'sausage'
  end
end
