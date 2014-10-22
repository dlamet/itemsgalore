require 'spec_helper'


feature 'Merchant Update' do

  before(:each) do
    Merchant.create(name: 'Sneaky Pete', address: '123 Doggem St.')
  end

  scenario 'User updates a merchant' do
    visit '/merchants'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Name', :with => 'Honest Pete'
    click_button 'Update Merchant'
    expect(page).to have_text('Merchant was successfully updated.')
  end

  scenario 'User fails to update a merchant' do
    visit '/merchants'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Name', :with => ''
    click_button 'Update Merchant'
    expect(page).to have_text("Name can't be blank")
  end

end