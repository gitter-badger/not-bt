require 'rails_helper'

feature 'Submit a report', %q(
  As a user
  I want to submit a report
  So I can notify the city of an issue

  Acceptance Criteria
    [x] I must be signed in
    [x] I must enter a category and an address
    [x] I may optionally include a description
    [x] I may optionally upload a photo
    [x] The Address is geocoded automatically
    [x] If all fields are complete, I am told that my report has been saved
    [x] If a field is incomplete, I am given an error message and brought back
        to the input form.
  ) do

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      within '.new_user' do
        click_on 'Log in'
      end
    end

    scenario 'user submits a report with valid attributes' do
      Category.create!(name: 'Streetlight')
      Category.create!(name: 'Damaged Sign')
      report = FactoryGirl.build(:report)

      visit new_report_path

      fill_in 'Address', with: report.address
      select 'Streetlight', from: 'Category'
      click_on 'Submit Report'
      expect(page).to have_content('Report submitted successfully')
      expect(page).to have_content('42.3515662')
      expect(page).to have_content('-71.0613815')
    end

    scenario 'user submits a report with invalid attributes' do
      visit new_report_path
      click_on 'Submit Report'
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("Category can't be blank")
    end
  end

  context 'unauthenticated visitor' do
    scenario 'unauthenticated visitor cannot add report' do
      visit new_report_path
      expect(page).to have_content 'You need to sign in or sign up before
                                   continuing.'
    end
  end
end
