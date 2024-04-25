# frozen_string_literal: true

module Media
  class GameFieldsController < ApplicationController
    def index
      @game_fields = GameField.order_by_name
    end
  end
end
