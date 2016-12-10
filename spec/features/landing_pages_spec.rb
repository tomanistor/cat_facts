require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
      Steps 'Being welcomed' do
        Given 'I am on the landing page' do
          visit '/'
        end
        Then 'I can fill in registration information AND hit submit' do
          fill_in 'name', with: 'Toma'
          fill_in 'address', with: 'box'
          fill_in 'city', with: 'box city'
          fill_in 'state', with: 'BX'
          fill_in 'zip', with: '80085'
          fill_in 'country', with: 'Boxtopia'
          fill_in 'email', with: 'box@box.box'
          fill_in 'user_id', with: 'TomasFunHouse'
          fill_in 'password', with: '******'
          click_button 'Register'
        end
        Then 'I can see my profile information' do
          expect(page).to have_content('Name: Toma')
          expect(page).to have_content('Address: box')
          expect(page).to have_content('City: box city')
          expect(page).to have_content('State: BX')
          expect(page).to have_content('Country: Boxtopia')
          expect(page).to have_content('Zip: 80085')
          expect(page).to have_content('Email: box@box.box')
          expect(page).to have_content('User ID: TomasFunHouse')
          expect(page).to have_content('Password: ******')
        end



      end
    end
end
