json.(@board, :id, :title, :private, :created_at, :updated_at)
json.tasks @board.tasks_by_status