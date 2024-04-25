# frozen_string_literal: true

module Media
  class ApplicationController < ActionController::Base
    layout 'media/application'

    private

    def breadcrumbs
      if defined?(@breadcrumbs)
        @breadcrumbs
      else
        @breadcrumbs = []
      end
    end
    helper_method :breadcrumbs

    def add_breadcrumb(name, path = nil)
      breadcrumbs << Breadcrumb.new(name:, path:)
    end
    helper_method :add_breadcrumb
  end
end
