# frozen_string_literal: true

class GameField < ApplicationRecord
  include UniversalId

  setup_universal_id('gmf')

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :google_maps_url, presence: true, url: { host: /\Amaps\.app\.goo\.gl\Z/ }
  validates :google_maps_embed_src_url, presence: true, url: { host: /\Awww\.google\.com\Z/ }

  scope :search_by_keyword, lambda { |query|
    where(<<-SQL.squish, query: "%#{query}%")
      universal_id LIKE :query
      OR name LIKE :query
      OR address LIKE :query
      OR google_maps_url LIKE :query
    SQL
  }
end
