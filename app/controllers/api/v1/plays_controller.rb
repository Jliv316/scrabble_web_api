class Api::V1::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create 
    play = Play.new(user_id: params[:user_id], game_id: params[:game_id], word: params[:word])
    score = play.score_word
    play.score = score
    play.save

    @status = {"Created Response": 201}
    render status: 201, json: @status.to_json
  end
end