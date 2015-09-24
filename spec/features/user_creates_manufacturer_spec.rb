require 'rails_helper'

feature 'user creates a manufacturer', %Q{
  As a signed up user
  I want to create a manufacturer
  So that I can add them to the manufacturer listings
} do
  scenario 'enter a manufacturer' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit new_manufacturer_path
    save_and_open_page
    fill_in 'Name', with: 'Atlas Tech'
    fill_in 'Country', with: 'USA'
    click_button 'Submit'
    expect(page).to have_content('name: Atlas Tech')
    expect(page).to have_content('country: USA')
  end

  scenario 'submit a blank form' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit new_manufacturer_path

    click_button 'Submit'
    expect(page).to have_content('Name cannot be blank.')
    expect(page).to have_content('Country cannot be blank.')
  end
end
