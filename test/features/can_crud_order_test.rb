require 'helpers/test_helper'

feature 'customer can create orders' do
  scenario 'a customer with no active orders wants to order a large extra pepperoni' do
    sign_in :customer
    visit ''

    click_on 'ORDER ONLINE'
    click_on 'Extra Pepperoni'
    select 'Large', from:'item_sizes'
    click_on 'Add to Order'

    page.must_have_content 'Large'
  end
end
