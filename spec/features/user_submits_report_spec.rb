require 'rails_helper'

feature "Submit a report", %q{
  As a user
  I want to submit a report
  So I can notify the city of an issue

  Acceptance Criteria
    [ ] I must enter a category and an address
    [x] If all fields are complete, I am told that my report has been saved
    [ ] If a field is incomplete, I am given an error message and brought back to the input form.
  } do

    scenario 'user submits a report' do
      report = FactoryGirl.build(:report)

      visit new_report_path
      fill_in "Category", with: report.category
      fill_in "Address", with: report.address
      click_on "Submit Report"
      expect(page).to have_content("Report submitted successfully")
    end

end
