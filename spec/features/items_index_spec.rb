require 'spec_helper'


feature 'Item Index' do

  scenario 'User views the items index page' do
    visit '/'
    check_login_state(page)
    expect(page).to have_title("LivingSocial data-Engineering")
    expect(page).to have_content("Listing Items")
  end

end
