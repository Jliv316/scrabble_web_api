class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def game_scores
    player_1_score = plays.where(user_id: player_1).sum(:score)
    player_2_score = plays.where(user_id: player_2).sum(:score)

    scores = {
      "game_id":id,
      "scores": [
        {
          "user_id":player_1.id,
          "score":player_1_score
        },
        {
          "user_id":player_2.id,
          "score":player_2_score
        }
      ]
    }

    return scores
  end
end
