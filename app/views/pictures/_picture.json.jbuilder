json.extract! picture, :id, :title, :url, :uid, :content, :created_at, :updated_at
json.url picture_url(picture, format: :json)