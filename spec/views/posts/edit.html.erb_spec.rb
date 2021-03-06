require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      category_id: 1,
      tag_id: 1,
      title: "MyString",
      content: "MyText",
      thumbnail: "MyText",
      author_id: 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[category_id]"

      assert_select "input[name=?]", "post[tag_id]"

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "textarea[name=?]", "post[thumbnail]"

      assert_select "input[name=?]", "post[author_id]"
    end
  end
end
