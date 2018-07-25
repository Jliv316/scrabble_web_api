class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    binding.pry
    render json: User.find(params[:user_id]).favorites
  end

  def show
    render json: Game.find(params[:id]).game_scores, serializer: GameScoreSerializer
  end

  def create
  end
end

{
  "game_id":1,
  "scores": [
    {
      "user_id":1,
      "score":15
    },
    {
      "user_id":2,
      "score":16
    }
  ]
}