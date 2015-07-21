class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text :title
      t.boolean :private, default: true
      t.references :user
      t.timestamps null: false
    end
  end
end
