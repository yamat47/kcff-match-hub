# frozen_string_literal: true

class Team < ApplicationRecord
  include UniversalId

  setup_universal_id('tem')
  has_one_attached(:logo)

  scope :search_by_keyword, lambda { |query|
    where(<<-SQL.squish, query: "%#{query}%")
      universal_id LIKE :query
      OR name LIKE :query
    SQL
  }
end
