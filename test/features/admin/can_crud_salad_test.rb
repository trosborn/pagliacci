require 'helpers/test_helper'

feature 'admin can CRUD salads' do
  before :each do
    sign_in :admin
  end
  scenario 'admin wants to create a salad' do
    visit salads_path
    click_on 'Add New Salad'
    fill_in 'Name', with: 'Pagliaccio'

    fill_in 'Small price', with: 4.99
    fill_in 'Medium price', with: 7.99
    fill_in 'Large price', with: 14.99

    check 'salami'
    check 'garbanzo_beans'
    check 'kasseri'
    check 'red_onions'
    check 'red_peppers'
    check 'pagliaccio_dressing'

    click_on 'Create'

    page.must_have_content 'Pagliaccio'
    page.must_have_content '4.99'
    page.must_have_content '7.99'
    page.must_have_content '14.99'
    page.must_have_content 'salami'
    page.must_have_content 'garbanzo beans'
    page.must_have_content 'kasseri'
    page.must_have_content 'red onions'
    page.must_have_content 'red peppers'
    page.must_have_content 'pagliaccio dressing'
    page.must_have_content 'Salad was successfully created.'
  end
  scenario 'admin wants to edit a salad' do
    visit salads_path

    click_on 'Edit Caesar Salad'

    fill_in 'Name', with: 'Brutus'

    fill_in 'Small price', with: 1.11
    fill_in 'Medium price', with: 2.22
    fill_in 'Large price', with: 3.33

    click_on 'Update'

    page.must_have_content 'Brutus'
    page.must_have_content '1.11'
    page.must_have_content '2.22'
    page.must_have_content '3.33'
    page.must_have_content 'Salad was successfully updated.'
  end
  scenario 'admin wants to delete a salad' do
    visit salads_path

    click_on 'Delete Caesar Salad'

    page.wont_have_content 'Caesar Salad'
  end
end
