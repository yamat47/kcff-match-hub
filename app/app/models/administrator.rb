# frozen_string_literal: true

class Administrator < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  before_validation :reset_name, if: -> { name.blank? }

  scope :name_ordered, -> { order(name: :asc) }
  scope :search_by_keyword, ->(query) { where('name LIKE :query OR email LIKE :query', query: "%#{query}%") }

  # 8文字のランダムな英数字を生成してnameにセットする。
  # ただし既存のレコードと重複しないこともチェックする。
  # 重複していた場合は再度ランダムな英数字を生成してセットする。
  def reset_name
    new_name = loop do
      candidate = SecureRandom.alphanumeric(8)
      break candidate unless Administrator.exists?(name: candidate)
    end

    self.name = new_name
  end
end
