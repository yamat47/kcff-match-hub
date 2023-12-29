# frozen_string_literal: true

def signin_admin(administrator:)
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:google_oauth2, { info: { email: administrator.email } })

  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

  get '/auth/google_oauth2/callback'
end
