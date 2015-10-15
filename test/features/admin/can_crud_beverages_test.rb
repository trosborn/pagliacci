require 'helpers/test_helper'

feature 'admin can crud beverages' do
  before :each do
    sign_in :admin
  end
  scenario 'as a site admin, I can add a new beverage' do
    visit beverages_path

    click_on 'Add New Beverage'
    fill_in 'Name', with: 'Latino Cola'
    fill_in 'Description', with: 'No HFCS. Yum.'
    fill_in 'Single price', with: 1.99
    fill_in 'beverage[six_price]', with: 5.49
    click_on 'Save'

    page.must_have_content 'Latino Cola'
    page.must_have_content 'No HFCS. Yum'
    page.must_have_content '1.99'
    page.must_have_content '5.49'
    page.must_have_content 'Beverage was successfully created.'
  end
  scenario 'as a site admin, I can edit a beverage' do
    test_beverage = beverages(:nuka_cola)
    visit beverage_path test_beverage

    click_on edit
    fill_in 'Name', with: 'Slug-o-Cola'
    fill_in 'Description', with: 'Drink Slug-o-Cola, and keep your teeth that lovely shade of green.'
    fill_in 'Single price', with: 1.11
    fill_in 'beverage[six_price]', with: 2.22
    click_on 'Save'

    page.must_have_content 'Slug-o-Cola'
    page.must_have_content 'Drink Slug-o-Cola, and keep your teeth that lovely shade of green.'
    page.must_have_content '1.11'
    page.must_have_content '2.22'
    page.must_have_content 'Beverage was successfully updated.'
  end
  scenario 'as a site admin, I can delete a gelato' do
    test_beverage = beverages(:nuka_cola)
    visit beverage_path test_beverage

    click_on 'Delete'

    page.wont_have_content 'Nuka-Cola'
    page.must_have_content 'Beverage was successfully destroyed.'
  end
end
