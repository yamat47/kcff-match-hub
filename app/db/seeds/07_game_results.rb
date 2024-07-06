# frozen_string_literal: true

require 'factory_bot'

GameSchedule.find_each do |game_schedule|
  next if [true, false].sample

  result = GameResult.results.keys.sample

  case result
  when 'home_win'
    FactoryBot.create(:game_result, :home_win, game_schedule:)
  when 'visitor_win'
    FactoryBot.create(:game_result, :visitor_win, game_schedule:)
  when 'draw'
    FactoryBot.create(:game_result, :draw, game_schedule:)
  when 'canceled'
    FactoryBot.create(:game_result, :canceled, game_schedule:)
  end
end
