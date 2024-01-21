# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe 'search_by_keyword scope' do
    let!(:admin1) { create(:administrator, universal_id: 'adm_Alice_Wonderland', email: 'alice@example.com') }
    let!(:admin2) { create(:administrator, universal_id: 'adm_Bob_Builder', email: 'bob@example.com') }
    let!(:admin3) { create(:administrator, universal_id: 'adm_Charlie_Chocolate', email: 'charlie@example.com') }

    context 'when a matching universal_id is given' do
      it 'returns administrators with universal_ids that match the query' do
        expect(Administrator.search_by_keyword('Alice')).to include(admin1)
        expect(Administrator.search_by_keyword('Alice')).not_to include(admin2, admin3)
      end
    end

    context 'when a matching email is given' do
      it 'returns administrators with emails that match the query' do
        expect(Administrator.search_by_keyword('bob@example.com')).to include(admin2)
        expect(Administrator.search_by_keyword('bob@example.com')).not_to include(admin1, admin3)
      end
    end

    context 'when a partial match is given' do
      it 'returns administrators with universal_ids or emails that contain the query' do
        expect(Administrator.search_by_keyword('lice')).to include(admin1)
        expect(Administrator.search_by_keyword('uilder')).to include(admin2)
        expect(Administrator.search_by_keyword('hoco')).to include(admin3)
      end
    end

    context 'when no match is found' do
      it 'returns an empty collection' do
        expect(Administrator.search_by_keyword('nonexistent')).to be_empty
      end
    end
  end
end
