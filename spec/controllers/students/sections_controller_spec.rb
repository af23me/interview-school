# frozen_string_literal: true

describe Students::SectionsController, type: :controller do
  describe 'GET #sections' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
