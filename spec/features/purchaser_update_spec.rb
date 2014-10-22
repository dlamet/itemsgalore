require 'spec_helper'


RSpec.describe 'Purchaser Update' do

  before(:each) do
    Purchaser.create(name: 'The Black Hand')
  end

  scenario 'User updates a purchaser' do
    visit '/purchasers'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Name', :with => 'Amnesty International'
    click_button 'Update Purchaser'
    expect(page).to have_text('Purchaser was successfully updated.')
  end

  scenario 'User fails to update a purchaser' do
    visit '/purchasers'
    check_login_state(page)
    click_link 'Edit'
    fill_in 'Name', :with => ''
    click_button 'Update Purchaser'
    expect(page).to have_text("Name can't be blank")
  end

end