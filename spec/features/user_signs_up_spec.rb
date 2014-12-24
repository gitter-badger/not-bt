require 'rails_helper'

feature "User signs up", %q{
  As a user
  I want to sign up for Bright Lights
  So that I can use all of its awesome features.

  Acceptance Criteria
    [x] There is a link to 'Sign Up' on the homepage.
    [x] If I fill in my username, email, password, and password
        confirmation correctly, I am greeted with a confirmation message
        that my account has been created.
    [ ] I may optionally supply my phone number
    [ ] If the password and password confirmation fields do not match, I am
        given an error message.
    [ ] If my email already exists in the database, I am given a message that
        tells me I have already registered.
    [ ] If my email is not formatted correctly, I am given an error message.
  } do

    scenario 'user provides valid infomation' do
      visit root_path
      click_on "Sign Up"
      fill_in "Username", with: "lizvdk"
      fill_in "Email", with: "liz@example.com"
      fill_in "Password", with: "supersecret"
      fill_in "Password confirmation", with: "supersecret"

      click_on "Sign up"

      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    scenario 'password fields do not match' do
      visit root_path
      click_on "Sign Up"
      fill_in "Username", with: "lizvdk"
      fill_in "Email", with: "liz@example.com"
      fill_in "Password", with: "supersecret"
      fill_in "Password confirmation", with: "notsupersecret"

      click_on "Sign up"

      expect(page).to have_content "Passwords do not match"
    end
end
