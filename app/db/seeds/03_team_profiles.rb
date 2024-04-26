# frozen_string_literal: true

require 'factory_bot'

Team.find_each do |team|
  FactoryBot.create(:team_profile, team:)
end
