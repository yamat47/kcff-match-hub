# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'
      t.string :name, null: false, comment: 'チーム名'

      t.timestamps
    end
  end
end
