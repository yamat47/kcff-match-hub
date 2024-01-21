# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /admin/administrators' do
  # This administrator is created with a universal_id set to appear after the paginated users in tests
  let!(:administrator) { create(:administrator, universal_id: 'adm_100', email: 'login-user@example.com') }

  describe 'pagination' do
    before do
      1.upto(31) do |index|
        formatted_index = "adm_#{format('%03d', index)}"
        create(:administrator, universal_id: formatted_index, email: "#{formatted_index}@example")
      end
    end

    context 'when on the first page' do
      before do
        signin_admin(administrator:)

        get '/admin/administrators'
      end

      specify 'renders the first page of administrators' do
        expect(response.body).to include('adm_001')
        expect(response.body).to include('adm_030')
        expect(response.body).not_to include('adm_031')
      end
    end

    context 'when on the second page' do
      before do
        signin_admin(administrator:)

        get '/admin/administrators?page=2'
      end

      specify 'renders the second page of administrators' do
        expect(response.body).not_to include('adm_001')
        expect(response.body).not_to include('adm_030')
        expect(response.body).to include('adm_031')
      end
    end
  end
end
