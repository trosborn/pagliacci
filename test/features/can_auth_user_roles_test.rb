require 'helpers/test_helper'

feature 'Site Roles' do
  scenario 'as a customer, I cannot see the Edit Menu button' do
    visit root_path
    sign_in :thomas

    page.wont_have_content 'Edit Menu'
  end
end

