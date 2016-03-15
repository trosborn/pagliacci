require 'helpers/test_helper'

feature 'admin can CRUD locations' do
  before :each do
    sign_in :admin
  end
  scenario 'as an admin, I can create a location' do
    visit admin_locations_path

    click_on 'New Location'
    fill_in 'Name', with: 'Lake City Way'
    fill_in 'Nickname', with: 'LCW'
    check 'Slices'
    fill_in 'location[seating_capacity]', with: '24'
    fill_in 'Line1', with: '8024 15th AVE NE'
    fill_in 'City', with: 'Seattle'
    fill_in 'State', with: 'WA'
    fill_in 'Zip', with: '98117'
    click_on 'Save'

    page.must_have_content 'Lake City Way'
    page.must_have_content 'LCW'
    page.must_have_content 'Serves slices!'
    page.must_have_content 'Seating Capacity: 24'
    page.must_have_content '8024 15th AVE NE'
    page.must_have_content 'Seattle'
    page.must_have_content 'WA'
    page.must_have_content '98117'
    page.must_have_content 'Location was successfully created.'
  end
  scenario 'as an admin, I can edit a location' do
    test_location = locations(:lake_city_way)
    visit admin_location_path test_location

    click_on edit
    fill_in 'Name', with: 'Tahoma'
    fill_in 'Nickname', with: 'OG Tacoma'
    fill_in 'location[seating_capacity]', with: '99'
    uncheck 'Slices'
    fill_in 'Line1', with: 'Antarctica'
    fill_in 'City', with: 'Mexico City'
    fill_in 'State', with: 'VA'
    fill_in 'Zip', with: '11111'
    click_on 'Save'

    page.must_have_content 'Tahoma'
    page.must_have_content 'OG Tacoma'
    page.must_have_content 'Seating Capacity: 99'
    page.wont_have_content 'Serves Slices!'
    page.must_have_content 'Location was successfully updated.'
    page.must_have_content 'Antarctica'
    page.must_have_content 'Mexico City'
    page.must_have_content 'VA'
    page.must_have_content '11111'
    page.must_have_content 'Location was successfully updated.'
  end
  scenario 'as an admin, I can delete a location' do
    test_location = locations(:lake_city_way)
    visit admin_location_path test_location

    click_on delete

    page.wont_have_content 'Lake City Way'
    page.wont_have_content 'LCW'
    page.wont_have_content 'Servies Slices!'
    page.wont_have_content 'Seating Capacity: 24'
    page.must_have_content 'Location was successfully destroyed.'
  end
end
