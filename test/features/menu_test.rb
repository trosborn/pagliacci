require 'helpers/test_helper'

feature 'visitor can view menu items' do
  before :each do
    visit menu_path
  end
  scenario 'I want to see /active/ primo pizzas on the menu' do
    page.must_have_content 'CHANTERELLE AND PROSCIUTTO'
    page.wont_have_content 'HIPSTER PRIMO'
  end
  scenario 'I want to see the regular pizzas' do
    page.must_have_content 'VEGGIE FRESH'
  end
  scenario 'I want to see the salads' do
    page.must_have_content 'CAESAR'
  end
  scenario 'I want to see the standard toppings' do
    page.must_have_content 'pepperoni'
  end
  scenario 'I want to see the /active/ seasonal toppings' do
    page.must_have_content 'chanterelle mushrooms'
    page.wont_have_content 'beets'
  end
  scenario 'I want to see the beverages' do
    page.must_have_content 'coke'
  end
  scenario 'I want to see the /active/ gelatos' do
    page.must_have_content 'panna'
    page.wont_have_content 'gingersnap'
  end
end
