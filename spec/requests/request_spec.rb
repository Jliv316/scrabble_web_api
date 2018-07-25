require 'rails_helper'

describe 'scrabble API' do
  let(:user1){ create(:user)}
  let(:user2){ create(:user)}
 
 context 'get request to /api/v1/games/1' do
    it 'responds with game, users, and scores' do
       game = create(:game, player_1: user1.id, player_2: user2.id)
      create(:play, user_id: user1.id, game_id: game.id, word: "at", score: 2)
      create(:play, user_id: user2.id, game_id: game.id, word: "at", score: 2)

      get '/api/v1/games/1'

      game = JSON.parse(response.body)
      binding.pry
      expect(response).to be_successful
    end
  end

  context 'sends post request to /api/v1/games/1/plays with a user_id=1 and word=at' do
    it '201 Created Response' do
       game = create(:game, player_1: user1.id, player_2: user2.id)
      create(:play, user_id: user1.id, game_id: game.id, word: "at", score: 2)
      create(:play, user_id: user2.id, game_id: game.id, word: "at", score: 2)

      post "/api/v1/games/1/plays"

      expect(response).to eq(201)
    end
  end

  context 'get request to /api/v1/games/1' do
    it 'updates user 1s score to 17' do
       game = create(:game, player_1: user1.id, player_2: user2.id)
      create(:play, user_id: user1.id, game_id: game.id, word: "at", score: 2)
      create(:play, user_id: user2.id, game_id: game.id, word: "at", score: 2)

      post "/api/v1/games/1/plays"

      get '/api/v1/games/1'

      game = JSON.parse(response.body)

    end
  end
end
