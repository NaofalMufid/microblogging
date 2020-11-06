require 'rails_helper'

RSpec.describe "Authors", type: :system do
  let(:author){ FactoryBot.create(:name, :email, :password) }

  describe "Index Page" do
    it "Show author Index Page" do
      visit authors_path
      assert_selector "h1", text: "Authors"
    end    
  end
  
  describe "Create new Author" do
    it "Can create new Author" do
      visit authors_path

      click_on "New Author"
      fill_in("Name", with: "Author Test")
      fill_in "Email", with: "author@test.com"
      fill_in "Password digest", with: "authortest"
      click_on "Create Author"

      assert_selector "p", text: "Author Test"
    end
  end
  
  describe "Update Author" do
    it "Can update Author ?" do
      visit authors_path

      click_on "New Author"
      fill_in("Name", with: "Author Test")
      fill_in "Email", with: "author@test.com"
      fill_in "Password digest", with: "authortest"
      click_on "Create Author"
      click_on "Back"
      click_on "Edit"
      fill_in("Name", with: "Update Author Test")
      fill_in "Email", with: "upauthor@test.com"
      fill_in "Password digest", with: "upauthortest"
      click_on "Update Author"

      assert_selector "p", text: "Update Author Test"
    end
  end

  describe "Delete Author System Test" do
    it "Can delete city ?" do
      visit authors_path

      click_on "New Author"
      fill_in("Name", with: "Author Test")
      fill_in "Email", with: "author@test.com"
      fill_in "Password digest", with: "authortest"
      click_on "Create Author"
      click_on "Back"
      accept_alert do
          click_on "Destroy"    
      end
      assert_selector "h1", text: "Authors"
    end
  end
end
