require 'spec_helper'


feature 'Item Show' do

  before(:each) do
    Item.create(description: 'Great Deal', price: 5, purchase_count: 30, purchaser: Purchaser.create(name: 'Joe'), merchant: Merchant.create(name: 'Fred', address: 'corner'))
  end

  scenario 'User views an item' do
    visit '/'
    check_login_state(page)
    click_link 'Show'
    expect(page).to have_text('Description: Great Deal')
    expect(page).to have_text('Purchaser: Joe')
  end

end