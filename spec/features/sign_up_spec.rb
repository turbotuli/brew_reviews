require 'spec_helper'
require 'rails_helper'

feature 'sign up' , %Q{
  As an unauthenticaed user
  I want to sign up
  So that I can submit brews for review, etc.
} do

  # ACCEPTANCE CRITERIA
  # I must specify a first name, last name and valid email address
  # I must specify a password and confirm that password
  # If I specify valid information, I register my account and am authenticated
  # If I do not specify valid information I am given errors

  scenario 'specifying valid and required info' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Welcome to Brew Reviews. Thanks for signing up!")
    expect(page).to have_content("Sign Out")
  end


  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'differentpassword'
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end


end
