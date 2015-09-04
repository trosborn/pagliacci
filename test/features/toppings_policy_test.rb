require 'helpers/test_helper'

feature 'crud buttons in toppings policy' do
  scenario 'non-admins cannot visit new toppings path' do
    visit new_topping_path

    page.current_path.must_equal '/'
  end
  scenario 'non-admins cannot see the edit button' do
    visit toppings_path

    page.wont_have_content 'Edit'
  end
  scenario 'non-admins cannot see the add new pizza button' do
    visit toppings_path

    page.wont_have_content 'Create Pizza Topping '
  end
  scenario 'admin can see the edit button' do
    sign_in :admin
    visit toppings_path

    page.must_have_content 'Edit'
  end
  scenario 'admin can see the add new pizza button' do
    sign_in :admin
    visit toppings_path

    page.must_have_content 'Create Pizza Topping'
  end
end
