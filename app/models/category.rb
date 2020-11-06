class Category < ApplicationRecord
    validates :name, presence: true,
                    length: {minimum:5, maximum:30},
                    uniqueness: {case_sensitive: false}
end
