require 'helpers/test_helper'

feature 'visitor can view menu items' do
  scenario 'I want to see active primo pizzas on the menu' do
    visit menu_path

    page.must_have_content 'SEASONAL PRIMO'
    page.wont_have_content 'HIPSTER PRIMO'
  end
  scenario 'I want to see the regular pizzas' do
    visit menu_path

    page.must_have_content 'VEGGIE PHRESH'
  end
  scenario 'I want to see the salads' do
    visit menu_path

    page.must_have_content 'CAESAR'
  end
  scenario 'I want to see the gelatos' do
    visit menu_path

    page.must_have_content 'COFFEE'
  end
  scenario 'I want to see the standard toppings' do
    visit menu_path

    page.must_have_content 'pepperoni'
  end
  scenario 'I want to see the /active/ seasonal toppings' do
    visit menu_path

    page.must_have_content 'cheese burger'
    page.wont_have_content 'crack burger'
  end
end
