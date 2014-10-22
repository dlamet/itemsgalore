require 'spec_helper'


feature 'Merchant Show' do

  before(:each) do
    Merchant.create(name: 'Fish Market', address: 'North by Northwest')
  end

  scenario 'User views a merchant' do
    visit '/merchants'
    check_login_state(page)
    click_link 'Show'
    expect(page).to have_text('Name: Fish Market')
    expect(page).to have_text('Address: North by Northwest')
  end

end