json.extract! post, :id, :category_id, :tag_id, :title, :content, :thumbnail, :author_id, :created_at, :updated_at
json.url post_url(post, format: :json)
