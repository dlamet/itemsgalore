require 'spec_helper'


feature 'Purchaser Show' do

  before(:each) do
    Purchaser.create(name: 'Paul the Peddler')
  end

  scenario 'User views a purchaser' do
    visit '/purchasers'
    check_login_state(page)
    click_link 'Show'
    expect(page).to have_text('Name: Paul the Peddler')
  end

end