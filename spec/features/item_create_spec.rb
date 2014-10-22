require 'spec_helper'


feature 'Item Create' do

  before(:each) do
    Merchant.create(name: "Yule's Tackle Shack")
    Purchaser.create(name: "Creative Vertical")
  end

  scenario 'User creates an item' do
    visit '/'
    check_login_state(page)
    click_link 'New Item'
    fill_in 'Description', :with => '1/2 off a dozen'
    fill_in 'Price', :with => '50'
    fill_in 'Purchase count', :with => '4'
    select "Yule's Tackle Shack", :from => 'Merchant'
    select "Creative Vertical", :from => 'Purchaser'
    click_button 'Create Item'
    expect(page).to have_text("Item was successfully created.")
  end

  scenario 'User fails to create an item on price presence' do
    visit '/'
    check_login_state(page)
    click_link 'New Item'
    fill_in 'Description', :with => '1/2 off a dozen'
    fill_in 'Purchase count', :with => '4'
    select "Yule's Tackle Shack", :from => 'Merchant'
    select "Creative Vertical", :from => 'Purchaser'
    click_button 'Create Item'
    expect(page).to have_text("Price is not a number")
  end

  scenario 'User fails to create an item on price validation' do
    visit '/'
    check_login_state(page)
    click_link "New Item"
    fill_in 'Description', :with => '1/2 off a dozen'
    fill_in 'Price', :with => '-1'
    fill_in 'Purchase count', :with => '4'
    select "Yule's Tackle Shack", :from => 'Merchant'
    select "Creative Vertical", :from => 'Purchaser'
    click_button 'Create Item'
    expect(page).to have_text("Price must be greater than or equal to 0.0")
  end

  scenario 'User fails to create an item on purchase count presence' do
    visit '/'
    check_login_state(page)
    click_link "New Item"
    fill_in 'Description', :with => '1/2 off a dozen'
    fill_in 'Price', :with => '50'
    select "Yule's Tackle Shack", :from => 'Merchant'
    select "Creative Vertical", :from => 'Purchaser'
    click_button 'Create Item'
    expect(page).to have_text("Purchase count is not a number")
  end

  scenario 'User fails to create an item on purchase count validation' do
    visit '/'
    check_login_state(page)
    click_link "New Item"
    fill_in 'Description', :with => '1/2 off a dozen'
    fill_in 'Price', :with => '50'
    fill_in 'Purchase count', :with => '-4'
    select "Yule's Tackle Shack", :from => 'Merchant'
    select "Creative Vertical", :from => 'Purchaser'
    click_button 'Create Item'
    expect(page).to have_text("Purchase count must be greater than or equal to 0")
  end

end