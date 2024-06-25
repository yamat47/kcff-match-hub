# frozen_string_literal: true

FactoryBot.define do
  factory :game_result do
    game_schedule
    home_team_score { rand(0..10) }
    visitor_team_score { rand(0..10) }

    result do
      if home_team_score > visitor_team_score
        :home_win
      elsif home_team_score < visitor_team_score
        :visitor_win
      elsif home_team_score.zero? && visitor_team_score.zero?
        :canceled
      else
        :draw
      end
    end
  end
end
