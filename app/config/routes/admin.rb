# frozen_string_literal: true

namespace :admin do
  root 'dashboards#show'

  resource :session, only: %i[new create destroy]
  resource :dashboards, only: [:show]
  resources :administrators
  resources :game_fields
  resources :tournaments
  resources :teams do
    resource :logo, module: :teams, only: %i[new create edit update destroy]
    resource :team_profile, module: :teams, only: %i[new create edit update]
  end
  resources :seasons
  resources :game_schedules
end
