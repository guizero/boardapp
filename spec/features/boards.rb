require 'spec_helper'

feature 'Boards' do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'user has no boards' do
    visit dashboard_path
    expect(page).to have_content "You have no boards yet, do you want to create one?"
  end

  scenario 'user creates a new board', js: true do
    page.execute_script %Q{ $('#myModal').modal('show') }
    sleep 1
    fill_in "Title", with: 'My awesome board'
  end
end
