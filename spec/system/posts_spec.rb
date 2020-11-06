require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:Post){ FactoryBot.create(:category_id, :tag_id, :title, :content, :thumbnail, :author_id) }

  describe "Index Page" do
    it "Show Post Index Page" do
      visit posts_path
      assert_selector "h1", text: "Posts"
    end    
  end
  
  describe "Create new Post" do
    it "Can create new Post" do
      visit posts_path

      click_on "New Post"
      fill_in "Category", with: "9"
      fill_in("Tag", with: "6")
      fill_in("Title", with: "Judul Title")
      fill_in "Content", with: "isinya content itu isi"
      fill_in "Thumbnail", with: "isinya thumbnail itu sebgaian"
      fill_in "Author", with: "12"
      click_on "Create Post"

      assert_selector "p", text: "Judul Title"
    end
  end
  
  describe "Update Post" do
    it "Can update Post ?" do
      visit posts_path

      click_on "New Post"
      fill_in "Category", with: "9"
      fill_in "Tag", with: "6"
      fill_in "Title", with: "Judul Title"
      fill_in "Content", with: "isinya content itu isi"
      fill_in "Thumbnail", with: "isinya thumbnail itu sebgaian"
      fill_in "Author", with: "12"
      click_on "Create Post"
      click_on "Back"
      click_on "Edit"
      fill_in "Category", with: "2"
      fill_in "Tag", with: "4"
      fill_in("Title", with: "Judul Title diganti")
      fill_in "Content", with: "isinya content ganti"
      fill_in "Thumbnail", with: "isinya thumbnail ganti"
      fill_in "Author", with: "5"
      click_on "Update Post"

      assert_selector "p", text: "Judul Title diganti"
    end
  end

  describe "Delete Post System Test" do
    it "Can delete Post ?" do
      visit posts_path

      click_on "New Post"
      fill_in("Category", with: "9")
      fill_in("Tag", with: "6")
      fill_in("Title", with: "Judul Title")
      fill_in "Content", with: "isinya content itu isi"
      fill_in "Thumbnail", with: "isinya thumbnail itu sebgaian"
      fill_in "Author", with: "12"
      click_on "Create Post"
      click_on "Back"
      accept_alert do
          click_on "Destroy"    
      end
      assert_selector "h1", text: "Posts"
    end
  end
end
