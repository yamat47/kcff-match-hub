# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /admin' do
  context 'when not logged in' do
    before do
      get '/admin'
    end

    specify 'redirects to the login page' do
      expect(response).to redirect_to(new_admin_session_path)
    end
  end

  context 'when logged in' do
    let(:administrator) { Administrator.create!(email: 'sample-hogehoge@example.com', name: 'hoge') }

    before do
      signin_admin(administrator:)

      get '/admin'
    end

    specify 'renders the admin dashboard' do
      expect(response).to have_http_status(:ok)
    end
  end
end
