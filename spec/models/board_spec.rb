require 'spec_helper'

RSpec.describe Board, type: :model do
  let(:board) { FactoryGirl.create(:board)}

  it "should have created a board" do
    expect(Board.find_by_id(board.id)).not_to eq(nil)
  end

  it "should be private" do
    expect(board.private).to eq(true)
  end

  it "should have created a correct verificator" do
    expect(board.verificator).to eq("0e9a442478b29497954bfa5b0d769d06")
  end

  describe "checking validations" do
    before do
      @board_new = Board.new
      @user = FactoryGirl.create(:user)
    end

    it "should not save the board without title or user" do
      @board_new.save
      expect(@board_new.errors.count).to be(2)
    end

    it "should not save the board with title only" do
      @board_new.title = "Awesome board"
      @board_new.save
      expect(@board_new.errors.count).to be(1)
    end

    it "should save the board with title and user" do
      @board_new.user = @user
      @board_new.title = "Awesome board"
      @board_new.save
      expect(@board_new.errors.count).to be(0)
    end
  end

  describe "dealing with tasks" do
    before do
      FactoryGirl.create_list(:task, 5, board_id: board.id, status: 0) # To-do
      FactoryGirl.create_list(:task, 5, board_id: board.id, status: 1) # In progress
      FactoryGirl.create_list(:task, 5, board_id: board.id, status: 2) # To verify
      FactoryGirl.create_list(:task, 5, board_id: board.id, status: 3) # Done
    end

    it "shoud have created the tasks correctly" do
      expect(board.tasks.count).to eq(20)
    end

    it "should return the corret data for use with angular" do
      expect(board.tasks_by_status.to_json.gsub!(/\"/, '\'')).to eq("{'0':{'name':'To-do','class':'red','items':[{'id':10021,'title':'Task number 21','status':0,'position':1},{'id':10022,'title':'Task number 22','status':0,'position':2},{'id':10023,'title':'Task number 23','status':0,'position':3},{'id':10024,'title':'Task number 24','status':0,'position':4},{'id':10025,'title':'Task number 25','status':0,'position':5}]},'1':{'name':'In Progress','class':'light-blue','items':[{'id':10026,'title':'Task number 26','status':1,'position':6},{'id':10027,'title':'Task number 27','status':1,'position':7},{'id':10028,'title':'Task number 28','status':1,'position':8},{'id':10029,'title':'Task number 29','status':1,'position':9},{'id':10030,'title':'Task number 30','status':1,'position':10}]},'2':{'name':'To verify','class':'yellow','items':[{'id':10031,'title':'Task number 31','status':2,'position':11},{'id':10032,'title':'Task number 32','status':2,'position':12},{'id':10033,'title':'Task number 33','status':2,'position':13},{'id':10034,'title':'Task number 34','status':2,'position':14},{'id':10035,'title':'Task number 35','status':2,'position':15}]},'3':{'name':'Done','class':'green','items':[{'id':10036,'title':'Task number 36','status':3,'position':16},{'id':10037,'title':'Task number 37','status':3,'position':17},{'id':10038,'title':'Task number 38','status':3,'position':18},{'id':10039,'title':'Task number 39','status':3,'position':19},{'id':10040,'title':'Task number 40','status':3,'position':20}]}}")
    end
  end
end
