require 'helpers/test_helper'

feature 'Admin Can CRUD Toppings' do
  before :each do
    sign_in :admin
  end
  scenario 'as a site admin, I can view a topping' do
    test_topping = toppings(:pepperoni)
    visit topping_path test_topping

    page.must_have_content 'Pepperoni'
  end
  scenario 'admin wants to create pizza topping' do
    visit toppings_path

    click_on 'Create Pizza Topping'
    fill_in 'Name', with: 'ricotta'
    check 'topping[active]'
    check 'topping[seasonal]'
    click_on 'Create'

    page.must_have_content 'Name: Ricotta'
    page.must_have_content 'Active'
    page.must_have_content 'Seasonal'
    page.must_have_content 'Topping was successfully created.'
  end
  scenario 'admin wants to edit a pizza topping' do
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
    page.must_have_content 'Topping was successfully updated.'
  end
  scenario 'admin wants to delete a pizza topping' do
    test_topping = toppings(:sausage)
    visit topping_path test_topping

    click_on 'Edit'
    click_on 'Delete'

    page.wont_have_content 'sausage'
  end
end
