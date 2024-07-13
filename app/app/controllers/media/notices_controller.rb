# frozen_string_literal: true

module Media
  class NoticesController < ApplicationController
    NOTICES_LIMIT = 30

    def index
      @notices = restricted_query.published_at_ordered.limit(NOTICES_LIMIT)
    end

    def show
      @notice = restricted_query.find_by!(universal_id: params[:id])
    end

    private

    def restricted_query
      Notice.only_published
    end
  end
end
