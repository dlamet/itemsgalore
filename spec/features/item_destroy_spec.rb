require 'spec_helper'


feature 'Item Destroy' do

  let(:item) {
    Item.create(description: 'Great Deal', price: 5, purchase_count: 30,
                purchaser: Purchaser.create(name: 'Joe'),
                merchant: Merchant.create(name: 'Fred', address: 'corner'))
  }

  scenario 'User destroys an item' do
    item # must instantiate item ahead of page load
    visit '/'
    check_login_state(page)
    click_link 'Destroy'
    expect(page).to have_text('Item was successfully destroyed.')
    expect{ Item.find(item.id) }.to raise_exception
  end

end