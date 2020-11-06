require 'rails_helper'

RSpec.describe "Categories", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  
  let(:category){ FactoryBot.crate(:name) }

  describe "Index Page" do
    it "Show cateories Index Page" do
      visit categories_path
      assert_selector "h1", text: "Categories"
    end    
  end
  
  describe "Create new Category" do
    it "Can create new category" do
      visit categories_path

      click_on "New Category"
      fill_in "Name", with: "Category Test"
      click_on "Create Category"

      assert_selector "p", text: "Category Test"
    end
  end
  
  describe "Update Category" do
    it "Can update category ?" do
      visit categories_path

      click_on "New Category"
      fill_in "Name", with: "New Category Test"
      click_on "Create Category"
      click_on "Back"
      click_on "Edit"
      fill_in "Name", with: "Update Category Test"
      click_on "Update Category"

      assert_selector "p", text: "Update Category Test"
    end
  end

  describe "Delete Category System Test" do
    it "Can delete city ?" do
      visit categories_path

      click_on "New Category"
      fill_in "Name", with: "Category Test"
      click_on "Create Category"
      click_on "Back"
      accept_alert do
          click_on "Destroy"    
      end
      assert_selector "h1", text: "Categories"
    end
  end
end
