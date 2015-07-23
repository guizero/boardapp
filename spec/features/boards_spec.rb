require 'spec_helper'

feature 'Boards' do
  before do
    @user = FactoryGirl.create(:user)
    @board = FactoryGirl.create(:board)
    @board.user = @user
    login_as(@user, :scope => :user)
  end

  scenario 'user has no boards' do
    visit dashboard_path
    expect(page).to have_content "You have no boards yet, do you want to create one?"
  end

  scenario 'user creates a new board', :js => true do
    visit dashboard_path
    find('.create_board').click
    sleep 1
    within("#myModal") do
      fill_in 'Title', :with => 'Awesome board'
      find('#board_title').set("Awesome board")
    end
    click_button "Create!"
    expect(page).to have_content "Awesome board"
  end

  scenario 'user deletes the new board', :js => true do
    visit board_path(@board)
    find("#delete-board").click
    expect(page).to have_content "Board successfully deleted"
  end
end
