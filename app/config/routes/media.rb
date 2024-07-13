# frozen_string_literal: true

with_options module: :media do
  resource :homes, only: [:show]
  resources :game_fields, only: :index
  resources :teams, only: :index
  resources :game_schedules, only: :index do
    get ':season', on: :collection, action: :index, as: :season
  end
  resources :notices, only: %i[index show]
end
