# frozen_string_literal: true

module Media
  class TeamsController < ApplicationController
    def index
      @teams = Team.order_by_name
                   .preload({ logo_attachment: :blob }, :team_profile)
    end
  end
end
