require 'spec_helper'
require 'rails_helper'

feature 'sign up' , %Q{
  As an unauthenticaed user
  I want to sign up
  So that I can submit brews for review, etc.
} do

# ACCEPTANCE CRITERIA
# I must specify a valid email address
# I must specify a password and confirm that password
# If I do perform the above I get an error
# If I specify valid information, I register my account and am authenticated

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


  scenario 'required information is not supplied'

  scenario 'password confirmation does not match confirmation'


end
