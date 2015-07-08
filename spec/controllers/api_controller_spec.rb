require 'rails_helper'

RSpec.describe(ApiController, type: :controller) do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the personal template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #index' do
   it 'responds successfully with an HTTP 200 status code' do
      post :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the personal template' do
      post :index
      expect(response).to render_template('index')
    end

    it 'renders successfully with params' do
      post :index, params: { curr: { city: 'kiel' } }
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end
end
