# frozen_string_literal: true

class Notice < ApplicationRecord
  include UniversalId

  setup_universal_id('ntc')

  validates :title, presence: true
  validates :content, presence: true

  scope :search_by_keyword,
        lambda { |query|
          where('universal_id LIKE :query OR title LIKE :query OR content LIKE :query', query: "%#{query}%")
        }
end
