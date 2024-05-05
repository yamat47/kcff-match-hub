# frozen_string_literal: true

class Season < ApplicationRecord
  include UniversalId

  setup_universal_id('ssn')

  has_many :game_schedules, dependent: :destroy

  validates :full_name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true

  scope :search_by_keyword, lambda { |query|
    where(<<-SQL.squish, query: "%#{query}%")
      universal_id LIKE :query
      OR full_name LIKE :query
      OR short_name LIKE :query
    SQL
  }

  scope :order_by_full_name, -> { order(:full_name) }
end
