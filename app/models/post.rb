class Post < ApplicationRecord
    # validations
    validates :category_id, presence: true
    validates :tag_id, presence: true
    validates :title, presence: true,length: {minimum: 5, maximum: 30}
    validates :content, presence: true,length: {minimum: 5, maximum: 30}
    validates :thumbnail, presence: true,length: {minimum: 5, maximum: 30}
    validates :author_id, presence: true
end
