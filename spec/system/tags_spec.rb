require 'rails_helper'

RSpec.describe "Tags", type: :system do
  let(:tag){ FactoryBot.create(:name) }

  it "Show tags index" do
    visit tags_path
    assert_selector "h1", text: "Tags"
  end    

  it "Can create new tag" do
    visit tags_path

    click_on "New Tag"
    fill_in "Name", with: "Tag Test"
    click_on "Create Tag"

    assert_selector "p", text: "Tag Test"
  end

  it "Can update tag ?" do
    visit tags_path

    click_on "New Tag"
    fill_in "Name", with: "New tag Test"
    click_on "Create Tag"
    click_on "Back"
    click_on "Edit"
    fill_in "Name", with: "Update tag Test"
    click_on "Update Tag"

    assert_selector "p", text: "Update tag Test"
  end

  it "Can delete city ?" do
    visit tags_path

    click_on "New Tag"
    fill_in "Name", with: "tag Test"
    click_on "Create Tag"
    click_on "Back"
    accept_alert do
        click_on "Destroy"    
    end
    assert_selector "h1", text: "Tags"
  end
end
