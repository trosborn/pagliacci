require 'helpers/test_helper'

feature 'admin can CRUD locations' do
  scenario 'as an admin, I can create a location' do
    visit locations_path

    click_on 'New Location'

    fill_in 'Name', with: 'Lake City Way'
    fill_in 'Nickname', with: 'LCW'
    check 'Slices'
    fill_in 'location[seating_capacity]', with: '24'

    click_on 'Save'

    page.must_have_content 'Lake City Way'
    page.must_have_content 'LCW'
    page.must_have_content 'Serves slices!'
    page.must_have_content 'Seating Capacity: 24'
    page.must_have_content 'Location was successfully created.'
  end
  scenario 'as an admin, I can edit a location' do
    test_location = locations(:lake_city_way)

    visit location_path test_location

    click_on 'Edit'
    fill_in 'Name', with: 'Tahoma'
    fill_in 'Nickname', with: 'OG Tacoma'
    fill_in 'location[seating_capacity]', with: '99'
    uncheck 'Slices'

    click_on 'Save'

    page.must_have_content 'Tahoma'
    page.must_have_content 'OG Tacoma'
    page.must_have_content 'Seating Capacity: 99'
    page.wont_have_content 'Serves Slices!'
    page.must_have_content 'Location was successfully updated.'
  end
  scenario 'as an admin, I can edit a location' do
    test_location = locations(:lake_city_way)

    visit location_path test_location

    click_on 'Delete'

    page.wont_have_content 'Lake City Way'
    page.wont_have_content 'LCW'
    page.wont_have_content 'Servies Slices!'
    page.wont_have_content 'Seating Capacity: 24'
  end
end
