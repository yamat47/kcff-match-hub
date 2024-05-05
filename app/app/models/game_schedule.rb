# frozen_string_literal: true

class GameSchedule < ApplicationRecord
  include UniversalId

  setup_universal_id('gms')

  belongs_to :season
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :game_field
  belongs_to :tournament

  validates :start_at, presence: true

  validate :home_team_and_visitor_team_must_be_different

  scope :start_at_ordered, -> { order(start_at: :asc) }

  scope :search_by_keyword, lambda { |query|
    joins(:home_team, :visitor_team, :game_field, :tournament)
      .where(<<-SQL.squish, query: "%#{query}%")
        game_schedules.universal_id LIKE :query
        OR teams.name LIKE :query
        OR game_fields.name LIKE :query
        OR tournaments.name LIKE :query
      SQL
  }

  delegate :name, to: :home_team, prefix: true, allow_nil: true
  delegate :name, to: :visitor_team, prefix: true, allow_nil: true
  delegate :name, to: :game_field, prefix: true, allow_nil: true
  delegate :name, to: :tournament, prefix: true, allow_nil: true

  def name
    "#{home_team_name} vs. #{visitor_team_name}"
  end

  def season_name
    season&.full_name
  end

  private

  def home_team_and_visitor_team_must_be_different
    return unless home_team && visitor_team

    errors.add(:visitor_team, :duplicated) if home_team == visitor_team
  end
end
