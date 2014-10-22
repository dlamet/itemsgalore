require 'spec_helper'


feature 'Merchant Create' do

  scenario 'User creates a new merchant' do
    visit '/merchants'
    check_login_state(page)
    click_link "New Merchant"
    fill_in 'Name', :with => 'The Pickle Slinger'
    fill_in 'Address', :with => '50 Wayward Way'
    click_button 'Create Merchant'
    expect(page).to have_text("Merchant was successfully created.")
  end

  scenario 'User fails to create a new merchant' do
    visit '/merchants'
    check_login_state(page)
    click_link "New Merchant"
    fill_in 'Address', :with => '50 Wayward Way'
    click_button 'Create Merchant'
    expect(page).to have_text("Name can't be blank")
  end

end