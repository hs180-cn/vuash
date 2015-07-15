require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post :create, message: { body: 'Some text' }, secret: 'secret'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #confirm' do
    before { allow(Message).to receive(:find) { double }}

    it 'returns http success' do
      get :confirm, id: 1, secret: 'secret'
      expect(response).to have_http_status(:success)
    end
  end

end
