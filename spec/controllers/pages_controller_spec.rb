require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #personal" do
    it "returns http success" do
      get :personal
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #fun" do
    it "returns http success" do
      get :fun
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #build" do
    it "returns http success" do
      get :build
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #social_projects" do
    it "returns http success" do
      get :social_projects
      expect(response).to have_http_status(:success)
    end
  end

end
