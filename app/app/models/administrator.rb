# frozen_string_literal: true

class Administrator < ApplicationRecord
  include UniversalId

  setup_universal_id('adm')

  validates :email, presence: true, uniqueness: true

  scope :search_by_keyword, ->(query) { where('universal_id LIKE :query OR email LIKE :query', query: "%#{query}%") }
end
