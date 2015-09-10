require 'helpers/test_helper'

['menu_pizza', 'salad', 'topping'].each do |item|
  feature 'non-admin policies' do
    scenario "I cannot visit the new #{item.humanize} page" do
      visit "/#{item.pluralize}/new"

      page.current_path.must_equal '/'
    end
    scenario 'non-admins cannot see the index edit button' do
      visit "#{item.pluralize}"

      page.wont_have_content 'Edit'
    end
    scenario 'non-admins cannot see the show edit button' do
      visit "#{item.pluralize}/1"

      page.wont_have_content 'Edit'
    end
    scenario 'non-admins cannot see the add new pizza button' do
      visit "#{item.pluralize}"

      page.wont_have_content "Add New #{item.humanize.capitalize}"
    end
  end
end
