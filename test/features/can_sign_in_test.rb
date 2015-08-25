require 'test_helper'

feature 'Account access' do
  scenario 'I want to create a new account' do
    visit new_user_session_path
    click_on 'Sign up'

    fill_in 'Email', with: 'yolo@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    page.must_have_content 'Welcome! You have signed up successfully.'
  end
  scenario 'I login as an existing user' do
    visit user_session_path

    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'

    page.must_have_content 'Signed in successfully.'
  end
  scenario 'I want to sign out' do
    sign_in :thomas

    click_on 'Log out'

    page.must_have_content 'Signed out successfully.'
  end
end
