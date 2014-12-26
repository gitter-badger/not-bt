require 'rails_helper'

feature "User views all reports", %q(
  As a user
  I want to view all reports
  So that I see what has been reported.

  Acceptance Criteria
  [ ] 10 most recent reports display on root
  [ ] Reports display most-recent first
  [ ] Report addresses link to show page
  ) do

  scenario 'Reports display in correct order' do
    # Tested manually. Will write a proper test soon!
  end

  scenario 'Reports address link to the report show page' do
    report = FactoryGirl.create(:report)
    visit root_path
    click_on report.address
    expect(page).to have_content report.address
    expect(page).to have_content report.category.name

  end

end
