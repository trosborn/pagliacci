require 'helpers/test_helper'

feature 'customer can complete order' do
  scenario 'customer wants to review order' do
    sign_in :customer
    visit ''

    click_on 'ORDER ONLINE'
    click_on 'EXTRA PEPPERONI'
    select 'Large', from: 'item_sizes'
    click_on 'Add to Order'
    click_on 'Checkout'
    select 'Lake City Way', from: 'order[location_id]'
    click_on 'Submit'
    click_on 'Checkout'

    page.must_have_content 'Lake City Way'
    page.must_have_content 'Large Extra Pepperoni'
  end
  scenario 'customer wants to finalize order' do
    sign_in :finalize_customer
    visit order_checkout_path

    click_on 'Finalize'

    page.must_have_content 'Status: Completed'
  end
end
