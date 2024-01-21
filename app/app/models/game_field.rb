# frozen_string_literal: true

class GameField < ApplicationRecord
  include UniversalId

  setup_universal_id('gmf')

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :google_maps_url, presence: true, url: { host: /\Amaps\.app\.goo\.gl\Z/ }
end
