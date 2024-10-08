# frozen_string_literal: true

namespace :admin do
  root 'dashboards#show'

  resource :session, only: %i[new create destroy]
  resource :dashboard, only: [:show]
  resources :administrators
  resources :game_fields
  resources :tournaments
  resources :teams do
    resource :logo, module: :teams, only: %i[new create edit update destroy]
    resource :team_profile, module: :teams, only: %i[new create edit update]
  end
  resources :seasons
  resources :game_schedules do
    resource :game_result, module: :game_schedules, only: %i[new create edit update destroy]
  end
  resources :notices
  resource :media_page_setting, only: %i[show] do
    resources :media_hero_images, module: :media_page_settings, only: %i[new create edit update destroy]
  end
  resources :documents, only: [:show], param: :slug
end
