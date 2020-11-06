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

RSpec.describe "/tags", type: :request do
  # Tag. As you add validations to Tag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      get tags_path
      expect(assigns(:tags)).to eq(Tag.all)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tag = Tag.create(name: 'Tag Tes')
      get tag_path(tag)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tag_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      tag = Tag.create(name: 'Tag Tes')
      get edit_tag_path(tag)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tag" do
        expect {
          post tags_path, params: { tag: {name:"testag"} }
        }.to change(Tag, :count).by(1)
      end

      it "redirects to the created tag" do
        post tags_path, params: { tag: {name:"tagtes"} }
        expect(response).to redirect_to(tag_url(Tag.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tag" do
        expect {
          post tags_path, params: { tag: {name:"tagtestagtestagtestagtestagtes"} }
        }.to change(Tag, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post tags_path, params: { tag: {name:"ta"} }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tag" do
        tag = Tag.create(name: "tagtes")
        patch tag_path(tag), params: { tag: {name: "testag"} }
        tag.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tag" do
        tag = Tag.create(name: "tagtes")
        patch tag_path(tag), params: { tag: {name: "testag"} }
        tag.reload
        expect(response).to redirect_to(tag_path(tag))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tag = Tag.create(name: "tagtes")
        patch tag_path(tag), params: { tag: {name: "12"} }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tag" do
      tag = Tag.create(name: "tagtes")
      expect {
        delete tag_path(tag)
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags list" do
      tag = Tag.create(name: "tagtes")
      delete tag_path(tag)
      expect(response).to redirect_to(tags_path)
    end
  end
end
