require 'rails_helper'

feature "User edits report", %q{
  As a user
  I want to edit my report
  So that I can correct any mistakes or add updates.

  Acceptance Criteria
    [ ] My edits must adheare to the original report requirements
    [ ] I must be the user who submitted the report
    } do

  scenario 'User edits his/her own report' do
    visit root_path
    Category.create!(name: 'Streetlight')
    Category.create!(name: 'Damaged Sign')
    @user = FactoryGirl.create(:user)
    login_as(@user)
    report = FactoryGirl.build(:report)
    click_on 'Submit a Report'
    fill_in 'Address', with: report.address
    select 'Streetlight', from: 'Category'
    click_on 'Submit Report'
    click_on 'Edit Report'
    fill_in 'Address', with: report.address
    select 'Damaged Sign', from: 'Category'
    click_on 'Submit Report'

    expect(page).to have_content 'Report was successfully updated'
    expect(page).to have_content 'Damaged Sign'
  end

  scenario 'User tries to edit a report he/she did not submit' do
    categoty = Category.create!(name: 'Streetlight')
    @reporting_user = FactoryGirl.create(:user)
    @malicious_user = FactoryGirl.create(:user)
    login_as(@malicious_user)
    report = FactoryGirl.create(:report, user: @reporting_user, category: categoty)

    visit edit_report_path(report)

    expect(page).to have_content "You may not edit a report you didn't post"
  end

end
