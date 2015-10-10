require 'helpers/test_helper'

feature 'Admin Can CRUD Menu Pizzas' do
  before :each do
    sign_in :admin
  end
  scenario 'as a site admin, I can view a pizza' do
    test_pizza = menu_pizzas(:veggie_fresh)

    visit menu_pizza_path test_pizza

    page.must_have_content 'Veggie Phresh'
  end
  scenario 'as a site admin, I can create a pizza' do
    visit menu_pizzas_path

    click_on 'Add New Pizza'
    fill_in 'Name', with: 'Brooklyn Bridge'
    fill_in 'Description', with: "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."
    fill_in 'Small price', with: 18.49
    fill_in 'Medium price', with: 22.49
    fill_in 'Large price', with: 25.99
    check 'pepperoni'
    check 'mushroom'
    check 'mozzarella'
    check 'red_sauce'
    check 'menu_pizza[active]'
    check 'menu_pizza[seasonal]'
    click_on 'Create'

    page.must_have_content 'Brooklyn Bridge'
    page.must_have_content "Pepperoni, Cascioppo Bros. Italian sausage,
    Ostrom's mushrooms, olives, green peppers, onions and mozzarella over our
    seasoned tomato sauce."
    page.must_have_content 'pepperoni'
    page.must_have_content 'mushroom'
    page.must_have_content 'mozzarella'
    page.must_have_content 'red sauce'
    page.must_have_content '18.49'
    page.must_have_content '22.49'
    page.must_have_content '25.99'
    page.must_have_content 'Active'
    page.must_have_content 'Seasonal'
    page.must_have_content 'Menu Pizza was successfully created.'
  end
  scenario 'as a site admin, I can edit a pizza' do
    test_pizza = menu_pizzas(:veggie_fresh)
    visit menu_pizza_path test_pizza

    click_on 'Edit'
    fill_in 'Name', with: 'Veggie Fresh'
    fill_in 'Description', with: 'All the veggies'
    fill_in 'Small price', with: 17.49
    fill_in 'Medium price', with: 21.49
    fill_in 'Large price', with: 24.99
    check 'mushroom'
    check 'red_sauce'
    uncheck 'menu_pizza[active]'
    check 'menu_pizza[seasonal]'
    click_on 'Update'

    page.wont_have_content 'Veggies and stuff'
    page.must_have_content 'All the veggies'
    page.wont_have_content '10'
    page.wont_have_content '50'
    page.wont_have_content '00.01'
    page.must_have_content '17.49'
    page.must_have_content '21.49'
    page.must_have_content '24.99'
    page.wont_have_content 'Active'
    page.must_have_content 'Seasonal'
    page.wont_have_content 'Veggie Phresh'
    page.must_have_content 'Veggie Fresh'
    page.must_have_content 'mushroom'
    page.must_have_content 'red sauce'
    page.must_have_content 'Menu Pizza was successfully updated.'
  end
  scenario 'as a site admin, I can delete a pizza' do
    test_pizza = menu_pizzas(:veggie_fresh)
    visit edit_menu_pizza_path test_pizza

    click_on 'Delete'

    page.wont_have_content 'Veggie Phresh'
  end
  scenario 'as a site admin, I am prevented from creating a pizza without a name' do
    visit new_menu_pizza_path

    click_on 'Create'

    page.must_have_content "Name can't be blank"
  end
end
