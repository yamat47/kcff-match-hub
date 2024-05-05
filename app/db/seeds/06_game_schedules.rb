# frozen_string_literal: true

require 'factory_bot'

team_combinations = Team.all.to_a.combination(2)

Season.find_each do |season|
  team_combinations.each do |home_team, visitor_team|
    # 50% chance to swap home and visitor teams
    home_team, visitor_team = visitor_team, home_team if [true, false].sample

    FactoryBot.create(
      :game_schedule,
      season:,
      home_team:,
      visitor_team:,
      game_field: GameField.all.sample,
      tournament: Tournament.all.sample
    )
  end
end
