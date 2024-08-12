# frozen_string_literal: true

class CreateMediaHeroImages < ActiveRecord::Migration[7.2]
  def change
    create_table :media_hero_images, comment: 'トップページのヒーロー画像' do |t|
      t.integer :sort_order, null: false, index: { unique: true }, comment: '並び順'
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'

      t.timestamps
    end
  end
end
