require 'spec_helper'
require 'rails_helper'

feature 'Sign in' , %Q{
  As a user
  I want to sign in
  So that I can submit brews for review, upvote, downvote, etc.
} do

  # ACCEPTANCE CRITERIA
  # If I specify a previously registered email and password
  # I am authenticated and I gain access
  # If I specify invald info I remain unauthenticated and receive rrros
  # If I am already signed in I can't sign in again
  scenario 'an existing user signs in successfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Welcome back, Brew Reviewer!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'user tries to sign in with non-existant email and password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'abc@bob.com'
    fill_in 'Password', with: 'pie'
    click_button 'Sign In'

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to_not have_content("Welcome back, Brew Reviewer!")
  end

  scenario 'user tries to sign in with existing email with the wrong password is denied access' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'invalidpassword'
    click_button 'Sign In'

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to_not have_content("Welcome back, Brew Reviewer!")

  end

  scenario 'an already authenticated user cannot sign in again' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in")
  end

end
