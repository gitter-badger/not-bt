require 'rails_helper'

feature "Submit a report", %q{
  As a user
  I want to submit a report
  So I can notify the city of an issue

  Acceptance Criteria
    [x] I must enter a category and an address
    [x] I may optionally include a description
    [x] I may optionally upload a photo
    [x] The Address is geocoded automatically
    [x] If all fields are complete, I am told that my report has been saved
    [x] If a field is incomplete, I am given an error message and brought back to the input form.
  } do

    scenario 'user submits a report with valid attributes' do
      report = FactoryGirl.build(:report)

      visit new_report_path
      fill_in "Category", with: report.category
      fill_in "Address", with: report.address
      click_on "Submit Report"
      expect(page).to have_content("Report submitted successfully")
      expect(page).to have_content("42.3515662")
      expect(page).to have_content("-71.0613815")
    end

    scenario 'user submits a report with invalid attributes' do
      report = FactoryGirl.build(:report)

      visit new_report_path
      click_on "Submit Report"
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("Category can't be blank")
    end

end
