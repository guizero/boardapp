class AddVerificatorToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :verificator, :string
  end
end
