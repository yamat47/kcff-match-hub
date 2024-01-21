# frozen_string_literal: true

class CreateGameFields < ActiveRecord::Migration[7.1]
  def change
    create_table :game_fields, comment: '試合会場' do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.string :name, null: false, index: { unique: true }, comment: '会場名'
      t.string :address, null: false, comment: '住所'
      t.string :google_maps_url, null: false, comment: 'GoogleマップURL'

      t.timestamps
    end
  end
end
