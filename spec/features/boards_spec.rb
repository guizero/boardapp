require 'spec_helper'

feature 'Boards' do
  before(:each) do
    @board = FactoryGirl.create(:board)
    login_as(@board.user)
  end

  scenario 'user has no boards' do
    visit dashboard_path
    expect(page).to have_content "You have no boards yet, do you want to create one?"
  end

  scenario 'user creates and deletes new board', :js => true do
    visit dashboard_path
    find('.create_board').click
    sleep 1
    within("#myModal") do
      fill_in 'Title', :with => 'Awesome board'
      find('#board_title').set("Awesome board")
    end
    click_button "Create board"
    expect(page).to have_content "Awesome board"
   
  end

  scenario 'user deletes new board', :js => true do
    visit board_path(@board)
    find("#delete-board").click
    expect(page).to have_content "Board successfully deleted"
  end
end
