require 'helpers/test_helper'

feature 'admin can CRUD gelato' do
  before :each do
    sign_in :admin
  end
  scenario 'as a site admin, I can create a gelato' do
    visit gelatos_path

    click_on 'Add New Gelato'
    fill_in 'Name', with: 'Sweet cream'
    fill_in 'Description', with: 'Much cream. So sweet. Wow.'
    check 'gelato[dairy]'
    click_on 'Save'

    page.must_have_content 'Sweet cream'
    page.must_have_content 'Much cream. So sweet. Wow.'
    page.must_have_content 'Contains dairy'
    page.must_have_content 'Gelato was successfully created.'
  end
  scenario 'as a site admin, I can edit a gelato' do
    test_gelato = gelatos(:coffee)
    visit gelato_path test_gelato

    click_on edit
    fill_in 'Name', with: 'Grape'
    fill_in 'Description', with: 'It is like wine in frozen milk'
    uncheck 'gelato[dairy]'
    click_on 'Save'

    page.wont_have_content 'Coffee'
    page.must_have_content 'Grape'
    page.wont_have_content 'Fresh roasted coffee beans with aged whole milk.'
    page.must_have_content 'It is like wine in frozen milk'
    page.wont_have_content 'Contains dairy'
    page.must_have_content 'Gelato was successfully updated.'
  end
  scenario 'as a site admin, I can delete a gelato' do
    test_gelato = gelatos(:coffee)
    visit edit_gelato_path test_gelato

    click_on 'Delete'

    page.wont_have_content 'Coffee'
    page.must_have_content 'Gelato was successfully destroyed.'
  end
  scenario 'as a site admin, I am prevented from creating a gelato without a name' do
    visit new_gelato_path

    click_on 'Save'

    page.must_have_content "Name can't be blank"
  end
end
