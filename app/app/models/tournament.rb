# frozen_string_literal: true

class Tournament < ApplicationRecord
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
end
