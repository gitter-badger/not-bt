require 'rails_helper'

feature 'User signs out', %q(
  As a user
  I want to be able to sign out
  So that other users of my computer can't pretend to be me

  Acceptance Criteria
  [ ] I see a confirmation message when I have sucessfully signed out
) do

  scenario 'user signs out' do
    user = FactoryGirl.create(:user)
    login_as(user)
    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully'
  end
end
