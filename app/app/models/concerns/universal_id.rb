# frozen_string_literal: true

module UniversalId
  extend ActiveSupport::Concern

  included do
    validate :validate_universal_id_prefix
  end

  class_methods do
    def setup_universal_id(prefix)
      define_method(:universal_id_prefix) { prefix }

      validates :universal_id, presence: true, uniqueness: true
      before_validation :reset_universal_id, if: -> { universal_id.blank? }
      scope :universal_id_ordered, -> { order(universal_id: :asc) }
    end
  end

  def reset_universal_id
    new_universal_id = loop do
      candidate = "#{universal_id_prefix}_#{SecureRandom.alphanumeric(8)}"
      break candidate unless self.class.exists?(universal_id: candidate)
    end

    self.universal_id = new_universal_id
  end

  private

  def validate_universal_id_prefix
    return if universal_id.blank? || universal_id.start_with?("#{universal_id_prefix}_")

    errors.add(:universal_id, :invalid_prefix)
  end
end
