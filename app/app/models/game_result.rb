# frozen_string_literal: true

class GameResult < ApplicationRecord
  include UniversalId

  setup_universal_id('gmr')

  belongs_to :game_schedule

  enum result: { home_win: 'home_win', visitor_win: 'visitor_win', draw: 'draw', canceled: 'canceled' }

  validates :game_schedule, uniqueness: true
  validates :home_team_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :visitor_team_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :home_win_score_must_be_higher, if: :home_win?
  validate :visitor_win_score_must_be_lower, if: :visitor_win?
  validate :draw_scores_must_be_equal, if: :draw?
  validate :canceled_scores_must_be_zero, if: :canceled?

  private

  def home_win_score_must_be_higher
    errors.add(:result, :inconsistent) unless home_team_score > visitor_team_score
  end

  def visitor_win_score_must_be_lower
    errors.add(:result, :inconsistent) unless home_team_score < visitor_team_score
  end

  def draw_scores_must_be_equal
    errors.add(:result, :inconsistent) unless home_team_score == visitor_team_score
  end

  def canceled_scores_must_be_zero
    errors.add(:home_team_score, :nonzero) unless home_team_score.zero?
    errors.add(:visitor_team_score, :nonzero) unless visitor_team_score.zero?
  end
end
