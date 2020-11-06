FactoryBot.define do
  factory :post do
    category_id { 1 }
    tag_id { 1 }
    title { "MyString" }
    content { "MyText" }
    thumbnail { "MyText" }
    author_id { 1 }
  end
end
