require 'spec_helper'


feature 'Purchaser Create' do

  scenario 'User creates a new purchaser' do
    visit '/purchasers'
    check_login_state(page)
    click_link "New Purchaser"
    fill_in 'Name', :with => 'Huckleberry'
    click_button 'Create Purchaser'
    expect(page).to have_text("Purchaser was successfully created.")
  end

  scenario 'User fails to create a new purchaser' do
    visit '/purchasers'
    check_login_state(page)
    click_link "New Purchaser"
    click_button 'Create Purchaser'
    expect(page).to have_text("Name can't be blank")
  end

end