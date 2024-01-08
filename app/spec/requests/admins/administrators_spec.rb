# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /admin/administrators' do
  # This administrator is created with a name set to appear after the paginated users in tests
  let!(:administrator) { create(:administrator, name: 'user-100', email: 'login-user@example.com') }

  describe 'pagination' do
    before do
      1.upto(31) do |index|
        formatted_index = "user-#{format('%03d', index)}"
        create(:administrator, name: formatted_index, email: "#{formatted_index}@example")
      end
    end

    context 'when on the first page' do
      before do
        signin_admin(administrator:)

        get '/admin/administrators'
      end

      specify 'renders the first page of administrators' do
        expect(response.body).to include('user-001')
        expect(response.body).to include('user-030')
        expect(response.body).not_to include('user-031')
      end
    end

    context 'when on the second page' do
      before do
        signin_admin(administrator:)

        get '/admin/administrators?page=2'
      end

      specify 'renders the second page of administrators' do
        expect(response.body).not_to include('user-001')
        expect(response.body).not_to include('user-030')
        expect(response.body).to include('user-031')
      end
    end
  end
end
