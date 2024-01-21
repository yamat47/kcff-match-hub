# frozen_string_literal: true

class GameField < ApplicationRecord
  validates :universal_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :google_maps_url, presence: true

  before_validation :reset_universal_id, if: -> { universal_id.blank? }

  # 8文字のランダムな英数字を生成してuniversal_idにセットする。
  # ただし既存のレコードと重複しないこともチェックする。
  # 重複していた場合は再度ランダムな英数字を生成してセットする。
  def reset_universal_id
    new_universal_id = loop do
      candidate = "gmf_#{SecureRandom.alphanumeric(8)}"
      break candidate unless GameField.exists?(universal_id: candidate)
    end

    self.universal_id = new_universal_id
  end
end
