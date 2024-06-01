# frozen_string_literal: true

namespace :auth do
  get ':provider/callback', to: '/admin/sessions#create'
  get 'failure', to: redirect('/')
end
