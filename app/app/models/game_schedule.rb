# frozen_string_literal: true

class GameSchedule < ApplicationRecord
  include UniversalId

  setup_universal_id('gms')

  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :game_field
  belongs_to :tournament

  validates :start_at, presence: true
end
