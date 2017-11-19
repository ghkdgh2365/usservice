json.extract! board, :id, :title, :content, :group_code, :user_id, :created_at, :updated_at
json.url board_url(board, format: :json)
