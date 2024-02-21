# frozen_string_literal: true

class CreateGameSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :game_schedules, comment: '試合スケジュール' do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.references :home_team, null: false, foreign_key: { to_table: :teams }, comment: 'ホームチームID'
      t.references :visitor_team, null: false, foreign_key: { to_table: :teams }, comment: 'ビジターチームID'
      t.references :game_field, null: false, foreign_key: true, comment: '試合会場ID'
      t.references :tournament, null: false, foreign_key: true, comment: '大会ID'
      t.datetime :start_at, null: false, comment: '試合開始日時'

      t.timestamps
    end
  end
end
