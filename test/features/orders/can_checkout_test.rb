require 'helpers/test_helper'

feature 'customer can complete order' do
  scenario 'customer wants to complete order' do
    sign_in :customer
    visit ''

    click_on 'ORDER ONLINE'
    click_on 'EXTRA PEPPERONI'
    select 'Large', from: 'item_sizes'
    click_on 'Add to Order'
    click_on 'Checkout'
    select 'Lake City Way', from: 'order[location_id]'
    click_on 'Review Order'

    page.must_have_content 'Lake City Way'
    page.must_have_content 'Large Extra Pepperoni'
  end
end
