class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    scores = Game.find(params[:id]).game_scores
    render json: scores
  end
end