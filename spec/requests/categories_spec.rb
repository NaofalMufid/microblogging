 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe Category, type: :request do
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "assign all categories to @categories" do
      get categories_path
      expect(assigns(:categories)).to eq(Category.all)
    end
  end

  describe "GET /show" do
    it "assign details category" do
      category = Category.create(
        name: Faker::Team.name.titlecase
      )
      get category_path(category)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "assign new category page" do
      get new_category_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      category = Category.create(
        name: Faker::Team.name.titlecase
      )
      get edit_category_path(category)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect {
          post categories_path, params: { category: {name: "UNCatgeories"} }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post categories_path, params: { category: {name: "UNCatgeories"} }
        expect(response).to redirect_to(category_path(Category.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post categories_path, params: { category: {name: "ora"} }
        }.to change(Category, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post categories_path, params: { category: {name: "ndak"} }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:category) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested category" do
        category = Category.create(
          name: Faker::Team.name.titlecase
        )
        name = "Namao"
        patch category_path(category), params: { category: {name: name} }
        category.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the category" do
        category = Category.create(
          name: Faker::Team.name.titlecase
        )
        patch category_path(category), params: { category: {name: Faker::Team.name.titlecase} }
        category.reload
        expect(response).to redirect_to(category_path(category))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        category = Category.create(
          name: Faker::Team.name.titlecase
        )
        patch category_path(category), params: { category: {name: "CapybaraCapybaraCapybaraCapybaraCapybaraCapybaraCapybara"} }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category = Category.create(
        name: Faker::Team.name.titlecase
      )
      expect {
        delete category_path(category)
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create(
        name: Faker::Team.name.titlecase
      )
      delete category_path(category)
      expect(response).to redirect_to(categories_path)
    end
  end
end
