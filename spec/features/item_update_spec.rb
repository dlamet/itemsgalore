require 'spec_helper'


feature 'Item Update' do

  before(:each) do
    Item.create(description: 'Big Deal', price: 5, purchase_count: 30,
                           purchaser: Purchaser.create(name: 'Joe'),
                           merchant: Merchant.create(name: 'Fred', address: 'corner'))
  end

  scenario 'User updates an item' do
    visit '/'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Description', :with => 'Big Huge Deal'
    click_button 'Update Item'
    expect(page).to have_text('Description: Big Huge Deal')
  end

  scenario 'User fails to update an item on price validation' do
    visit '/'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Price', :with => '-1'
    click_button 'Update Item'
    expect(page).to have_text('Price must be greater than or equal to 0.0')
  end

end