json.(@board, :id, :title, :created_at, :updated_at)
json.tasks @board.tasks_by_status