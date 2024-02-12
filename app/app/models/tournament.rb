# frozen_string_literal: true

class Tournament < ApplicationRecord
  include UniversalId

  setup_universal_id('tmt')

  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
end
