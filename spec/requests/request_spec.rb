require 'rails_helper'

describe 'scrabble API' do
 
 context 'get request to /api/v1/games/1' do
    it 'responds with game, users, and scores' do

      get '/api/v1/games/1'

      game = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
    end
  end

  context 'sends post request to /api/v1/games/1/plays with a user_id=1 and word=at' do
    it '201 Created Response' do

      post "/api/v1/games/1/plays"

      expect(response).to eq(201)
    end
  end

  context 'get request to /api/v1/games/1' do
    it 'responds with game, users, and scores' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/#{id}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item["id"]).to eq(id)

      get '/api/v1/games/1'

      game = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_items.count).to eq(3)
    end
  end