require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let(:valid_attributes) {
    attributes_for(:home)
  }

  let(:invalid_attributes) {
    { image: "", description: "", location: "", size: "", price: "" }
  }

  describe "GET /index" do
    it "returns a success response" do
      create(:home)
      get homes_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "returns a success response" do
      home = create(:home)
      get home_path(home)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Home" do
        expect {
          post homes_path, params: { home: valid_attributes }
        }.to change(Home, :count).by(1)
      end

      it "redirects to the created home" do
        post homes_path, params: { home: valid_attributes }
        expect(response).to redirect_to(Home.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Home" do
        expect {
          post homes_path, params: { home: invalid_attributes }
        }.to change(Home, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post homes_path, params: { home: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { image: "new_image_url", description: "An even more beautiful home", location: "Lyon", size: "200 sqm", price: "2000000" }
      }

      it "updates the requested home" do
        home = create(:home)
        patch home_path(home), params: { home: new_attributes }
        home.reload
        expect(home.description).to eq("An even more beautiful home")
      end

      it "redirects to the home" do
        home = create(:home)
        patch home_path(home), params: { home: new_attributes }
        home.reload
        expect(response).to redirect_to(home)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        home = create(:home)
        patch home_path(home), params: { home: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested home" do
      home = create(:home)
      expect {
        delete home_path(home)
      }.to change(Home, :count).by(-1)
    end
  
    it "redirects to the admin path" do
      home = create(:home)
      delete home_path(home)
      expect(response).to redirect_to(home_admin_path)  
    end
  end

  

end

