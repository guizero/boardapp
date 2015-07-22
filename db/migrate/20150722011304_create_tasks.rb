class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.integer :status, default: 0
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
