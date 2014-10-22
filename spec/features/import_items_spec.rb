require 'spec_helper'


feature 'Import Items' do

  it 'User imports the example CSV file' do
    visit '/'
    check_login_state(page)
    click_link 'Import Items'
    expect(page).to have_text("File to upload")
    attach_file('import_file_upload_file', 'example_data.csv')
    click_button 'Import Items'
    expect(page).to have_text("4 items imported.")
    expect(page).to have_text("New gross revenue = $95.00")
  end

  it 'User imports the example tab file' do
    visit '/'
    check_login_state(page)
    click_link 'Import Items'
    expect(page).to have_text("File to upload")
    attach_file('import_file_upload_file', 'example_data.tab')
    click_button 'Import Items'
    expect(page).to have_text("3 items imported.")
    expect(page).to have_text("New gross revenue = $835.00")
  end

end