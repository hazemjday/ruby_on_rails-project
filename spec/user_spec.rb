# spec/user_spec.rb
require 'rails_helper'

RSpec.describe "User Sessions", type: :request do
  let!(:user) { create(:user) }

  describe "POST /users/sign_in" do
    it "allows a user to sign in" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to redirect_to(homes_path)  
    end

    it "prevents sign in with wrong password" do
      post user_session_path, params: { user: { email: user.email, password: "wrongpassword" } }
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE /users/sign_out" do
    it "allows a user to sign out" do
      sign_in user
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end
  end
end
