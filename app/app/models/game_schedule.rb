# frozen_string_literal: true

class GameSchedule < ApplicationRecord
  include UniversalId

  setup_universal_id('gms')

  belongs_to :season
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :game_field
  belongs_to :tournament

  has_one :game_result, dependent: :destroy

  validates :start_at, presence: true

  validate :home_team_and_visitor_team_must_be_different

  scope :from_today, ->(now: Time.current) { where(start_at: now.beginning_of_day..) }
  scope :start_at_ordered, -> { order(start_at: :asc) }
  scope :game_field_ordered, -> { order(game_field_id: :asc) }

  scope :search_by_keyword, lambda { |query|
    joins(:home_team, :visitor_team, :game_field, :tournament)
      .where(<<-SQL.squish, query: "%#{query}%")
        game_schedules.universal_id LIKE :query
        OR teams.name LIKE :query
        OR game_fields.name LIKE :query
        OR tournaments.name LIKE :query
      SQL
  }

  # Returns all games scheduled on the same day as the next upcoming game.
  scope :next_scheduled_games, lambda { |now: Time.current|
    next_scheduled_datetime = from_today(now:).start_at_ordered
                                              .first
                                              &.start_at

    return none unless next_scheduled_datetime

    where(start_at: next_scheduled_datetime.all_day)
  }

  delegate :name, to: :home_team, prefix: true, allow_nil: true
  delegate :name, to: :visitor_team, prefix: true, allow_nil: true
  delegate :name, to: :game_field, prefix: true, allow_nil: true
  delegate :name, to: :tournament, prefix: true, allow_nil: true
  delegate :result, to: :game_result, prefix: true, allow_nil: true
  delegate :home_team_score, to: :game_result, prefix: true, allow_nil: true
  delegate :visitor_team_score, to: :game_result, prefix: true, allow_nil: true

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
