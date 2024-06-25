# frozen_string_literal: true

class CreateGameResults < ActiveRecord::Migration[7.1]
  def change
    create_table :game_results, comment: '試合結果' do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.references :game_schedule, null: false, index: { unique: true }, foreign_key: true, comment: '試合スケジュールID'
      t.integer :home_team_score, null: false, comment: 'ホームチームの得点'
      t.integer :visitor_team_score, null: false, comment: 'ビジターチームの得点'
      t.string :result, null: false, comment: '試合結果ステータス'

      t.timestamps
    end
  end
end
