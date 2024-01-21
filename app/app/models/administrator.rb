# frozen_string_literal: true

class Administrator < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :universal_id, presence: true, uniqueness: true

  before_validation :reset_universal_id, if: -> { universal_id.blank? }

  scope :universal_id_ordered, -> { order(universal_id: :asc) }
  scope :search_by_keyword, ->(query) { where('universal_id LIKE :query OR email LIKE :query', query: "%#{query}%") }

  # 8文字のランダムな英数字を生成してuniversal_idにセットする。
  # ただし既存のレコードと重複しないこともチェックする。
  # 重複していた場合は再度ランダムな英数字を生成してセットする。
  def reset_universal_id
    new_universal_id = loop do
      candidate = "adm_#{SecureRandom.alphanumeric(8)}"
      break candidate unless Administrator.exists?(universal_id: candidate)
    end

    self.universal_id = new_universal_id
  end
end
