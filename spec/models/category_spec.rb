require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Validation Presence Tests" do
    it "Ensure name presence" do
      category = Category.new(
        name: nil
      ).save
      expect(category).to eq(false)
    end
    
    it "Should save successfully" do
      category = Category.new(
        name: "sports"
      ).save
      expect(category).to eq(true)
    end
  end
  
  context "Validation Length Tests" do
    it "Ensure name character length, more than 5" do
      category = Category.new(
        name: 'test'
      ).save
      expect(category).to eq(false)
    end

    it "Ensure name character length, less than 30" do
      category = Category.new(
        name: 'Category Test Category Test Category Test Category Test'
      ).save
      expect(category).to eq(false)
    end
  end
  
  context "Validation Uniqueness Category" do
    before do
      Category.new(
        name: 'Politic'
      ).save
    end
    
    it "Ensures category name has uniqueness" do
      category = Category.new(
        name: 'Politic'
      ).save
      expect(category).to eq(false)
    end
    
  end
  
end
