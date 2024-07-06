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

    trait :home_win do
      home_team_score { rand(11..20) }
      visitor_team_score { rand(0..10) }
      result { :home_win }
    end

    trait :visitor_win do
      home_team_score { rand(0..10) }
      visitor_team_score { rand(11..20) }
      result { :visitor_win }
    end

    trait :draw do
      home_team_score { rand(0..10) }
      visitor_team_score { home_team_score }
      result { :draw }
    end

    trait :canceled do
      home_team_score { 0 }
      visitor_team_score { 0 }
      result { :canceled }
    end
  end
end
