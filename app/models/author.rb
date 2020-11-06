class Author < ApplicationRecord
    has_secure_password
    # validations
    validates :name, presence: true,
                        length: {minimum: 5, maximum: 30}

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                        uniqueness: {case_sensitive: false},
                        length: {maximum: 50},
                        format: {with: VALID_EMAIL_REGEX }

    validates :password_digest, presence: true,
                        length: {minimum: 8} 
end
