require 'spec_helper'


feature 'Merchant Destroy' do

  let(:merchant) {
    Merchant.create(name: 'Fred', address: 'corner')
  }

  scenario 'User destroys a merchant' do
    merchant # must instantiate merchant ahead of page load
    visit '/merchants'
    check_login_state(page)
    click_link 'Destroy'
    expect(page).to have_text('Merchant was successfully destroyed.')
    expect{ Merchant.find(merchant.id) }.to raise_exception
  end

end