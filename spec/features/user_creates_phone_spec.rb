require 'rails_helper'

feature 'user adds cellphone', %Q{
  As a used cellphone salesperson
  I want to record a newly acquired cellphone
  So that I can list it in my store
} do

  context 'add a new cell phone' do
    scenario 'entry is valid' do
      manufacturer = FactoryGirl.create(:manufacturer)

      visit new_phone_path

      select('Motorola', :from => 'phone[manufacturer_id]')

      fill_in 'phone[year]', with: '2004'
      fill_in 'phone[battery]', with: 'lots'
      click_button 'Submit'
      save_and_open_page
      expect(page).to have_content('New cell phone added')
      expect(page).to have_content('Motorola')

      expect(phones_path(@phone)).to eq(current_path)
    end

    scenario 'entry is invalid' do
      visit new_phone_path

      click_button 'Submit'

      expect(page).to have_content("Year can't be blank")
      expect(page).to have_content("Battery can't be blank")
      expect(page).to_not have_content('Motorola')

      expect(phones_path).to eq(current_path)
    end

    scenario 'optionally specify description' do
      manufacturer = FactoryGirl.create(:manufacturer)

      visit new_phone_path

      select('Motorola', :from => 'phone[manufacturer_id]')
      fill_in 'phone[year]', with: '2004'
      fill_in 'phone[battery]', with: 'lots'
      fill_in 'phone[description]', with: 'awesomeness'

      click_button 'Submit'

      expect(page).to have_content('New cell phone added')
      expect(page).to have_content('Motorola')

      expect(phones_path(@phone)).to eq(current_path)
    end
  end
end
