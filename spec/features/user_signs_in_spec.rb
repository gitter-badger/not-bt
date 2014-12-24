require 'rails_helper'

feature "User signs in", %q{
  As a user
  I want to sign in
  So that my reports can be associated with me

  Acceptance Criteria
    [ ] If my credentials are valid, I am redirected to root and
        shown welcome message
    [ ] If my credentials are invalid, I am shown errors
    } do

  scenario 'user provides valid credentials' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content "Signed in successfully"
    expect(page).to_not have_link "Sign Up"
    expect(page).to_not have_link "Sign In"
  end
end
