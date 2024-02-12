# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments, comment: '大会' do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.string :name, null: false, comment: '大会名'

      t.timestamps
    end

    add_index :tournaments, :name
  end
end
