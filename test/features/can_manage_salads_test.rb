require 'helpers/test_helper'

feature 'as a site admin, I can CRUD salads' do
  scenario 'I can create a salad' do
    visit new_salad_path
    fill_in 'Name', with: 'Pagliaccio'

    click_on 'Create'

    page.must_have_content 'Pagliaccio'
  end
  scenario 'I can add prices for each size of salad' do
    test_salad = salads(:caesar)

    visit edit_salad_path test_salad

    fill_in 'Small price', with: 4.99
    fill_in 'Medium price', with: 7.99
    fill_in 'Large price', with: 14.99

    click_on 'Create'

    page.must_have_content '4.99'
    page.must_have_content '7.99'
    page.must_have_content '14.99'
  end
end
