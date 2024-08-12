# frozen_string_literal: true

class MediaHeroImage < ApplicationRecord
  include UniversalId

  setup_universal_id('mhi')
  has_one_attached(:image)

  validates :sort_order, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }

  before_validation :set_sort_order, on: :create

  scope :sort_order_ordered, -> { order(:sort_order) }

  private

  def set_sort_order
    return if sort_order.present?

    self.sort_order = MediaHeroImage.maximum(:sort_order).to_i + 1
  end
end
