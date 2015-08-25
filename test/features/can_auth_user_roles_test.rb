require 'test_helper'

feature 'Site Roles' do
  scenario 'as a site admin, I can see the Edit Menu button' do
    sign_in :admin
    visit root_path

    page.must_have_content 'Edit Menu'
    page.wont_have_content 'Login to edit this menu'
  end
  scenario 'as a customer, I cannot see the Edit Menu button' do
    visit root_path
    sign_in :thomas

    page.wont_have_content 'Edit Menu'
    page.must_have_content 'Login to edit this menu'
  end
end

