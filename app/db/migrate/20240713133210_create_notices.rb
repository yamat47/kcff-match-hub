# frozen_string_literal: true

class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :title, null: false, comment: 'タイトル'
      t.text :content, null: false, comment: '内容'
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'

      t.timestamps
    end
  end
end
