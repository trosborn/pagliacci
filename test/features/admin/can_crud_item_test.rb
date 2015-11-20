require 'helpers/test_helper'

feature 'admin can CRUD items' do
  before(:each) { sign_in :admin }
  scenario 'admin wants to create an item', js: true do
    visit items_path

    click_on 'Add New Item'
    fill_in 'Name', with: 'Pagliaccio'
    fill_in 'Description', with: 'Green leaf lettuce tossed with garbanzo beans,
        diced red peppers, kasseri cheese, salami, red onions and our Dijon vinaigrette.'
    select 'Salad', from: 'Item Type'
    select 'Meat', from: 'Qualifier'
    click_on 'Add Size'
    find('.item_sizes_name input').set('Small')
    find('.item_sizes_price input').set('5.49')
    click_on 'Add Size'
    within(all('.item_sizes_name').last) { find('input').set('Large') }
    within(all('.item_sizes_price').last) { find('input').set('8.49') }
    click_on 'Add Size'
    within(all('.item_sizes_name').last) { find('input').set('Party') }
    within(all('.item_sizes_price').last) { find(' input').set('15.99') }
    check 'salami'
    check 'garbanzo_beans'
    check 'kasseri'
    check 'red_onions'
    check 'red_peppers'
    check 'pagliaccio_dressing'
    click_on 'Save'

    page.must_have_content 'Pagliaccio'
    page.must_have_content 'Green leaf lettuce tossed with garbanzo beans,
    diced red peppers, kasseri cheese, salami, red onions and our Dijon vinaigrette.'
    page.must_have_content 'Salad'
    page.must_have_content 'Meat'
    page.must_have_content 'Small'
    page.must_have_content '5.49'
    page.must_have_content 'Large'
    page.must_have_content '8.49'
    page.must_have_content 'Party'
    page.must_have_content '15.99'
    page.must_have_content 'salami'
    page.must_have_content 'garbanzo beans'
    page.must_have_content 'kasseri'
    page.must_have_content 'red onions'
    page.must_have_content 'red peppers'
    page.must_have_content 'pagliaccio dressing'
    page.must_have_content 'Item was successfully created.'
  end
  scenario 'admin wants to edit a item', js: true do
    test_item = items(:caesar)
    visit item_path test_item

    click_on edit
    fill_in 'Name', match: :first, with: 'Brutus'
    select 'Pizza', from: 'Item Type'
    within(all('.item_sizes_name')[0]) { find('input').set('Parvus') }
    within(all('.item_sizes_price')[0]) { find('input').set('1.11') }
    within(all('.item_sizes_name')[1]) { find('input').set('Amplus') }
    within(all('.item_sizes_price')[1]) { find('input').set('2.22') }
    within(all('.item_sizes_name')[2]) { find('input').set('Festum') }
    within(all('.item_sizes_price')[2]) { find('input').set('33.33') }
    click_on 'Save'

    page.wont_have_content 'Caesar'
    page.wont_have_content 'Small'
    page.wont_have_content '5.49'
    page.wont_have_content 'Large'
    page.wont_have_content '8.49'
    page.wont_have_content 'Party'
    page.wont_have_content '15.99'
    page.wont_have_content 'Salad'
    page.must_have_content 'Pizza'
    page.must_have_content 'Brutus'
    page.must_have_content 'Parvus'
    page.must_have_content '1.11'
    page.must_have_content 'Amplus'
    page.must_have_content '2.22'
    page.must_have_content 'Festum'
    page.must_have_content '33.33'
    page.must_have_content 'Item was successfully updated.'
  end
  scenario 'admin wants to delete a item' do
    test_item = items(:caesar)
    visit item_path test_item

    click_on 'Delete'

    page.wont_have_content 'Caesar'
    page.must_have_content 'Item was successfully destroyed.'
  end
end
