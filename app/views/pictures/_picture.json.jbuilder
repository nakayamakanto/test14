json.extract! picture, :id, :title, :url, :user_id, :content, :created_at, :updated_at
json.url picture_url(picture, format: :json)