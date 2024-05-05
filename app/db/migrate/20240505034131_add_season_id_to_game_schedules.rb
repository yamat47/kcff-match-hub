# frozen_string_literal: true

class AddSeasonIdToGameSchedules < ActiveRecord::Migration[7.1]
  def change
    add_reference :game_schedules, :season, null: false, foreign_key: true
  end
end
