require 'helpers/test_helper'

['item', 'location'].each do |item|
  feature 'non-admin policies' do
    scenario "non-admins cannot visit the new #{item.humanize} page" do
      visit "/#{item.pluralize}/new"

      page.current_path.must_equal '/'
    end
    scenario "non-admins cannot see the #{item.humanize} index edit button" do
      visit "#{item.pluralize}"

      page.wont_have_content edit
    end
    scenario "non-admins cannot see the #{item.humanize} show edit button" do
      visit "#{item.pluralize}/1"

      page.wont_have_content edit
    end
    scenario "non-admins cannot see the add new #{item.humanize} index button" do
      visit "#{item.pluralize}"

      page.wont_have_content "Add New #{item.humanize.capitalize}"
    end
    scenario "non-admins cannot see the delete #{item.humanize} button" do
      visit "#{item.pluralize}/1"

      page.wont_have_content delete
    end
  end
end
