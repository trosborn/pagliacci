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
require 'capybara/poltergeist'

class ActiveSupport::TestCase
  self.use_transactional_fixtures = false
  fixtures :all
end

Capybara.javascript_driver = :poltergeist

def sign_in role
  visit new_user_session_path
  fill_in 'Email', with: users(role).email
  fill_in 'Password', with: 'password'
  click_on 'Log in'
end

def edit
  'Edit'
end

def delete
  'Delete'
end
