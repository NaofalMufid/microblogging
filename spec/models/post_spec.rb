require 'rails_helper'

RSpec.describe Post, type: :model do
  
  context "Validation Presence Tests" do
    it "Ensure Category presence" do
      post = Post.new(
        category_id: nil,
        tag_id: Faker::IDNumber,
        title: Faker::Book.title,
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)  
    end

    it "Ensures Tag presence" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: nil,
        title: Faker::Book.title,
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false) 
    end
    
    it "Ensures title presence" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: nil,
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false) 
    end

    it "Ensures content presence" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Book.title,
        content: nil,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false) 
    end

    it "Ensures thumbnail presence" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Book.title,
        content: Faker::Quote.matz,
        thumbnail: nil,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false) 
    end

    it "Ensures author presence" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Book.title,
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: nil
      ).save
      expect(post).to eq(false) 
    end

    it "Should save successfully" do
      post = Post.new(
        category_id: "3",
        tag_id: "9",
        title: "Judul",
        content: "isi konten",
        thumbnail: "sebagian konten",
        author_id: "12"
      ).save
      expect(post).to eq(true)
    end
    
    
  end
  
  context "Validation Length Tests" do
    it "Ensures Title character length, more than 5" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: "cek",
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end
    
    it "Ensures Title character length, less than 30" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: "title adalah judul title adalah judul title adalah judultitle adalah judul",
        content: Faker::Quote.matz,
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end

    it "Ensures Content character length, more than 5" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Quote.matz,
        content: "cek",
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end
    
    it "Ensures Content character length, less than 30" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Quote.matz,
        content: "title adalah judul title adalah judul title adalah judultitle adalah judul",
        thumbnail: Faker::Quote.robin,
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end

    it "Ensures Thumbnail character length, more than 5" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Quote.matz,
        content: Faker::Quote.robin,
        thumbnail: "cek",
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end
    
    it "Ensures thumbnail character length, less than 30" do
      post = Post.new(
        category_id: Faker::IDNumber,
        tag_id: Faker::IDNumber,
        title: Faker::Quote.matz,
        content: Faker::Quote.robin,
        thumbnail: "title adalah judul title adalah judul title adalah judultitle adalah judul",
        author_id: Faker::IDNumber,
      ).save
      expect(post).to eq(false)
    end
    
  end
  
end
