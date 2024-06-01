# frozen_string_literal: true

module Media
  module GameFieldHelper
    def media_game_field_anchor(game_field)
      dom_id(game_field, :media)
    end
  end
end
