require 'test_helper'

feature 'crud buttons in menu pizza policy' do
  scenario 'non-admins cannot visit new menu pizza path' do
    visit new_menu_pizza_path

    page.current_path.must_equal '/'
  end
  scenario 'non-admins cannot see the create menu pizza button' do
    visit menu_pizzas_path

    page.current_path.must_equal '/menu_pizzas'
  end
  scenario 'non-admins cannot see the edit button' do
    visit menu_pizzas_path

    page.wont_have_content 'Edit'
  end
  scenario 'non-admins cannot see the add new pizza button' do
    visit menu_pizzas_path

    page.wont_have_content 'Add New Pizza'
  end
  scenario 'admin can see the edit button' do
    sign_in :admin
    visit menu_pizzas_path

    page.must_have_content 'Edit'
  end
  scenario 'admin can see the add new pizza button' do
    sign_in :admin
    visit menu_pizzas_path

    page.must_have_content 'Add New Pizza'
  end
end
