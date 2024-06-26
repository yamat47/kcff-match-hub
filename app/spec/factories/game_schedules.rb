# frozen_string_literal: true

FactoryBot.define do
  factory :game_schedule do
    season
    home_team factory: %i[team]
    visitor_team factory: %i[team]
    game_field
    tournament
    start_at { Faker::Time.between(from: 1.year.ago, to: 1.year.since) }
  end
end
