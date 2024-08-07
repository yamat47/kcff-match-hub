# frozen_string_literal: true

require 'factory_bot'

team_combinations = Team.all.to_a.combination(2)

Season.find_each do |season|
  team_combinations.each do |home_team, visitor_team|
    # 50% chance to swap home and visitor teams
    home_team, visitor_team = visitor_team, home_team if [true, false].sample

    # Generate a random start time within the season year, starting from a Sunday
    year = season.short_name.to_i
    start_at = Faker::Time.between(
      from: DateTime.new(year, 1, 2),
      to: DateTime.new(year, 12, 30)
    ).beginning_of_week(:sunday)
                          .change(hour: rand(0..23), min: rand(0..59))

    FactoryBot.create(
      :game_schedule,
      season:,
      home_team:,
      visitor_team:,
      start_at:,
      game_field: GameField.all.sample,
      tournament: Tournament.all.sample
    )
  end
end
