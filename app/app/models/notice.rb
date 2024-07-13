# frozen_string_literal: true

class Notice < ApplicationRecord
  include UniversalId

  setup_universal_id('ntc')

  attr_accessor :published

  validates :title, presence: true
  validates :content, presence: true

  before_validation :reset_published_at

  scope :search_by_keyword,
        lambda { |query|
          where('universal_id LIKE :query OR title LIKE :query OR content LIKE :query', query: "%#{query}%")
        }

  scope :only_published, -> { where.not(published_at: nil) }
  scope :published_at_ordered, -> { order(published_at: :desc) }

  def published?
    published_at.present?
  end

  private

  def reset_published_at
    if published
      self.published_at ||= Time.current
    else
      self.published_at = nil
    end
  end
end
