require 'rails_helper'

RSpec.describe(SearchesController, type: :controller) do
  describe 'POST #show' do
    it 'returns http success' do
      post :show, search: { term: 'bird' }
      expect(response).to have_http_status(200)
    end
  end
end
