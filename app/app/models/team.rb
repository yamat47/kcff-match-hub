# frozen_string_literal: true

class Team < ApplicationRecord
  include UniversalId

  setup_universal_id('tem')
  has_one_attached(:logo)

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

  # FIXME: Returns a random URL to be displayed temporarily, as there is currently no means of persistence.
  def x_url
    [true, false].sample ? 'https://example.com' : nil
  end

  # FIXME: Returns a random URL to be displayed temporarily, as there is currently no means of persistence.
  def instagram_url
    [true, false].sample ? 'https://example.com' : nil
  end

  # FIXME: Returns a random URL to be displayed temporarily, as there is currently no means of persistence.
  def homepage_url
    [true, false].sample ? 'https://example.com' : nil
  end
end
