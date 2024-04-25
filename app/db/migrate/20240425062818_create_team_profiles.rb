# frozen_string_literal: true

class CreateTeamProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :team_profiles, comment: 'チーム情報' do |t|
      t.references :team, null: false, foreign_key: true, index: { unique: true }
      t.string :x_url
      t.string :instagram_url
      t.string :homepage_url

      t.timestamps
    end
  end
end
