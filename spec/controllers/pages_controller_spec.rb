require 'rails_helper'

RSpec.describe(PagesController, type: :controller) do

  describe 'GET #personal' do
    it 'responds successfully with an HTTP 200 status code' do
      get :personal
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the personal template' do
      get :personal
      expect(response).to render_template('personal')
    end
  end

  describe 'GET #fun' do
    it 'returns http success' do
      get :fun
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #build' do
    it 'responds successfully with an HTTP 200 status code' do
      get :build
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :build
      expect(response).to render_template('build')
    end
  end

  describe 'GET #social_projects' do
    it 'returns http success' do
      get :social_projects
      expect(response).to have_http_status(:success)
    end
  end

end
