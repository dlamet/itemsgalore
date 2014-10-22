require 'spec_helper'


feature 'Purchaser Destroy' do

  let(:purchaser) {
    Purchaser.create(name: 'Dog Tired Marketing')
  }

  scenario 'User destroys a purchaser' do
    purchaser # must instantiate purchaser ahead of page load
    visit '/purchasers'
    check_login_state(page)
    click_link 'Destroy'
    expect(page).to have_text('Purchaser was successfully destroyed.')
    expect{ Purchaser.find(purchaser.id) }.to raise_exception
  end

end