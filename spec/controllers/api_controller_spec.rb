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

    it 'knows its params' do
      post :index
      expect(controller.params[:curr_city]).to match 'berlin'
      expect(controller.params[:forecast_city]).to match 'berlin'

    end

    it 'changes its params' do
      # not working?? cant seem to change berlin to kiel this way, but how else?
      post :index, params: {curr: 'kiel', forecast: 'kiel'}
      expect(controller.params[:curr_city]).to match 'kiel'
      expect(controller.params[:forecast_city]).to match 'kiel'
    end
  end
end
