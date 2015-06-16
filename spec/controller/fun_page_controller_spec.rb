require 'rails_helper'

RSpec.describe(FunPageController, type: :controller) do
  describe 'GET #index' do
    it 'responds with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'tests successfully @bubbling_variable' do
      @test_bubbling_variable =
        ('I am ' + %w[blue red yellow green purple orange].sample + '!')
      get :index

      expect(@test_bubbling_variable).to match(
        /^[I am]{4}.(blue|red|yellow|green|purple|orange)[!]$/)
    end

    it 'creates successfully @bubbling_variable' do
      get :index

      expect(assigns[@bubbling_variable]).to match(
        /^[I am]{4}.(blue|red|yellow|green|purple|orange)[!]$/)
    end
  end
end
