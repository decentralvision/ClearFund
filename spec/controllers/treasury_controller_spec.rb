require 'rails_helper'

RSpec.describe TreasuryController, type: :controller do

  describe "GET #donate" do
    it "returns http success" do
      get :donate
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #membership" do
    it "returns http success" do
      get :membership
      expect(response).to have_http_status(:success)
    end
  end

end
