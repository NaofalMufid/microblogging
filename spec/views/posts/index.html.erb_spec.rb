require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        category_id: 2,
        tag_id: 3,
        title: "Title",
        content: "MyText",
        thumbnail: "MyText",
        author_id: 4
      ),
      Post.create!(
        category_id: 2,
        tag_id: 3,
        title: "Title",
        content: "MyText",
        thumbnail: "MyText",
        author_id: 4
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
