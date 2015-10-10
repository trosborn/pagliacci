if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!('rails')
end
Rails.env = 'test'
require File.expand_path('../../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'minitest/autorun'

class ActiveSupport::TestCase
  fixtures :all
end

def sign_in role
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end
