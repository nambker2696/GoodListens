json.extract! album_like, :id, :user_id, :album_id, :created_at, :updated_at
json.url album_like_url(album_like, format: :json)
