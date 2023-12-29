# frozen_string_literal: true

module Admin
  class SessionsController < ApplicationController
    skip_before_action :check_logged_in, only: %i[new create]

    def new; end

    def create
      email = omniauth_params.info.email
      administrator = Administrator.find_or_create_by(email:, &:reset_name)

      session[:administrator_id] = administrator.id

      redirect_to admin_root_path
    end

    def destroy
      session.delete(:administrator_id)

      redirect_to root_path
    end

    private

    def omniauth_params
      request.env['omniauth.auth']
    end
  end
end
