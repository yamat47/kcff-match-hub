# frozen_string_literal: true

module Media
  class TeamsController < ApplicationController
    def index
      @teams = Team.order_by_name
    end
  end
end
