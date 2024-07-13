# frozen_string_literal: true

class AddPublishedAtToNotices < ActiveRecord::Migration[7.1]
  def change
    add_column :notices, :published_at, :datetime, comment: '公開日時'

    add_index :notices, :published_at
  end
end
