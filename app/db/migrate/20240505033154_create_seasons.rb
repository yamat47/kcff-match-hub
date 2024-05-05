# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.string :full_name, null: false, index: { unique: true }, comment: '名前'
      t.string :short_name, null: false, index: { unique: true }, comment: '短縮名'

      t.timestamps
    end
  end
end
