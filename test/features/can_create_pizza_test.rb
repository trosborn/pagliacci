require "test_helper"

feature "Can Create Pizza" do
  scenario "I can create a Brooklyn Bridge" do
    visit pizzas_path

    click_on 'Create Pizza'
    fill_in 'name', with 'Brooklyn Bridge'
    click_on 'Add Toppings'

    fill_in 'Topping 1', with
  end
end
