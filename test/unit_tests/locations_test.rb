require 'helpers/test_helper'
require 'minitest/spec'

describe Location do
  it 'will delete its associated address when destroyed' do
    test_location = Location.create(name: '', address_attributes: {zip: '98221'})
    test_location.destroy
    assert test_location.address.destroyed?, 'The associated address should be deleted'
  end
end
