# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    if Rails.env.production?
      http_basic_authenticate_with(name: ENV.fetch('ADMIN_BASIC_AUTH_NAME'),
                                   password: ENV.fetch('ADMIN_BASIC_AUTH_PASSWORD'))
    end

    layout 'admin/application'

    before_action :check_logged_in

    private

    def current_administrator
      return unless (administrator_id = session[:administrator_id])

      @current_administrator ||= Administrator.find_by(id: administrator_id)
    end
    helper_method :current_administrator

    def logged_in?
      current_administrator.present?
    end
    helper_method :logged_in?

    def check_logged_in
      return if logged_in?

      redirect_to new_admin_session_path
    end

    def breadcrumbs
      if defined?(@breadcrumbs)
        @breadcrumbs
      else
        root_breadcrumb = Breadcrumb.new(name: I18n.t('view.admin.breadcrumbs.root'), path: admin_root_path)
        @breadcrumbs = [root_breadcrumb]
      end
    end
    helper_method :breadcrumbs

    def add_breadcrumb(name, path = nil)
      breadcrumbs << Breadcrumb.new(name:, path:)
    end
    helper_method :add_breadcrumb
  end
end
