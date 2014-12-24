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
end
