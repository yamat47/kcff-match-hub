# frozen_string_literal: true

module Media
  class HomesController < ApplicationController
    NOTICES_LIMIT = 3

    def show
      @notices = Notice.only_published
                       .published_at_ordered
                       .limit(NOTICES_LIMIT)
    end
  end
end
