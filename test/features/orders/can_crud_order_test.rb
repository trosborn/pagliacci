require 'helpers/test_helper'

feature 'customer can create orders' do
  scenario 'a customer with no active orders wants to order a large extra pepperoni' do
    sign_in :customer
    visit ''

    click_on 'ORDER ONLINE'
    click_on 'Extra Pepperoni'
    select 'Large', from: 'item_sizes'
    click_on 'Add to Order'

    page.must_have_content 'large'
    page.must_have_content 'extra pepperoni'
  end
  scenario 'a customer wants to order a medium side1 extra pepperoni side2 green pepper' do
    sign_in :customer
    visit ''

    click_on 'ORDER ONLINE'
    click_on 'Extra Pepperoni'
    select 'Medium', from: 'item_sizes'
    within('#side2') {check 'green_pepper'}
    click_on 'Add to Order'
    page.must_have_content 'medium'
    page.must_have_content 'green pepper'
    page.must_have_content 'extra pepperoni'
  end
end
