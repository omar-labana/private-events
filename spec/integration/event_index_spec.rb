require 'rails_helper'

RSpec.describe 'home page', type: :system do
  describe 'index page' do
    it 'checks for main link presence' do
      visit root_path
      expect(page).to have_css('a', text: 'Log in')
    end

    it 'checks for h1 presence' do
      visit root_path
      expect(page).to have_css('h1', text: 'All events')
    end

    it 'checks for signup links when no user session' do
      visit root_path
      expect(page).to have_css('a', text: 'Sign up')
    end
  end
  describe 'user sessions', type: :feature do
    it 'checks routing when no user session' do
      visit root_path
      click_link 'Create an event'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    it 'checks for existing session then routes user' do
      User.create({ username: 'omar', email: 'omar@ramo.com', password: 'omaruramo',
                    password_confirmation: 'omaruramo' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'omar@ramo.com'
      fill_in 'Password', with: 'omaruramo'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'checks for logout notice' do
      User.create({ username: 'omar', email: 'omar@ramo.com', password: 'omaruramo',
                    password_confirmation: 'omaruramo' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'omar@ramo.com'
      fill_in 'Password', with: 'omaruramo'
      click_button 'Log in'
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end

    it 'checks for existing user then adds a notice' do
      User.create({ username: 'omar', email: 'omar@ramo.com', password: 'omaruramo',
                    password_confirmation: 'omaruramo' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'ramo@omar.com'
      fill_in 'Password', with: 'invalid'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'routes me if a session exsits' do
      User.create({ username: 'omar', email: 'omar@ramo.com', password: 'omaruramo',
                    password_confirmation: 'omaruramo' })
      visit root_path
      click_link 'Create an event'
      fill_in 'Email', with: 'omar@ramo.com'
      fill_in 'Password', with: 'omaruramo'
      click_button 'Log in'
      expect(page).to have_content 'New Event'
    end
  end
end
