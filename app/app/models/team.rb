# frozen_string_literal: true

class Team < ApplicationRecord
  include UniversalId

  setup_universal_id('tem')
  has_one_attached(:logo)

  has_one :team_profile, dependent: :destroy

  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex

  scope :order_by_name, -> { order(:name) }

  scope :search_by_keyword, lambda { |query|
    where(<<-SQL.squish, query: "%#{query}%")
      universal_id LIKE :query
      OR name LIKE :query
    SQL
  }

  delegate :url, to: :logo, prefix: true
  delegate :x_url, :instagram_url, :homepage_url, to: :team_profile, allow_nil: true
end
