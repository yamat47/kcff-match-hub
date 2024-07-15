# frozen_string_literal: true

module Media
  module TeamHelper
    def team_logo_url(team)
      team.logo_url || 'icon-team-fallback.png'
    end
  end
end
