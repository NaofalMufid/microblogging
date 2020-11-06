require 'rails_helper'

RSpec.describe Author, type: :model do
  context "Validation Presence Tests" do
    it "Ensure full name presence" do
      author = Author.new(
        name: nil,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)  
    end

    it "Ensures email presence" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: nil,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false) 
    end
    
    it "Ensures password presence" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: nil
      ).save
      expect(author).to eq(false) 
    end

    it "Should save successfully" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(true) 
    end
    
    
  end
  
  context "Validation Length Tests" do
    it "Ensures name character length, more than 5" do
      author = Author.new(
        name: 'ban',
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end
    
    it "Ensures full name character length, less than 30" do
      author = Author.new(
        name: 'tempebacemtempebacemtempebacemtempebacemtempebacem',
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end
    
    it "Ensures email character length, less than 50" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: 'kebukpintunyatapinggakkelihatanapapadanternyatanggakada@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false)
    end
    
    it "Ensures password character length, same or more than 8" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: 'kebuka'
      ).save
      expect(author).to eq(false) 
    end
    
  end
  
  context "Email Format Tests" do
    it "Ensures email format not valid" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: 'faker@faker',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false) 
    end
    
    it "Ensures email format valid" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: Faker::Internet.free_email,
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(true) 
    end
    
  end
  
  context "Email Uniqueness Tests" do
    before do
      Author.new(
        name: Faker::Team.name.titlecase,
        email: 'valnobcc@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
    end
    
    it "Ensures emal has uniqueness" do
      author = Author.new(
        name: Faker::Team.name.titlecase,
        email: 'valnobcc@gmail.com',
        password: Faker::Team.name.downcase.strip.gsub(' ', '')
      ).save
      expect(author).to eq(false) 
    end
    
  end
end
