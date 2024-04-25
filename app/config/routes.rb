# frozen_string_literal: true

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'media/homes#show'

  with_options module: :media do
    resource :homes, only: [:show]
    resources :game_fields, only: :index
    resources :teams, only: :index
  end

  namespace :admin do
    root 'dashboards#show'

    resource :session, only: %i[new create destroy]
    resource :dashboards, only: [:show]
    resources :administrators
    resources :game_fields
    resources :tournaments
    resources :teams do
      resource :logo, module: :teams, only: %i[new create edit update destroy]
    end
    resources :game_schedules
  end

  namespace :auth do
    get ':provider/callback', to: '/admin/sessions#create'
    get 'failure', to: redirect('/')
  end
end
