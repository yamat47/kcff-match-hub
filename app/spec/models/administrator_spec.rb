# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administrator do
  describe 'search_by_keyword scope' do
    let!(:admin_alice) { create(:administrator, universal_id: 'adm_Alice_Wonderland', email: 'alice@example.com') }
    let!(:admin_bob) { create(:administrator, universal_id: 'adm_Bob_Builder', email: 'bob@example.com') }
    let!(:admin_charlie) { create(:administrator, universal_id: 'adm_Charlie_Chocolate', email: 'charlie@example.com') }

    context 'when a matching universal_id is given' do
      it 'returns administrators with universal_ids that match the query' do
        expect(described_class.search_by_keyword('Alice')).to include(admin_alice)
        expect(described_class.search_by_keyword('Alice')).not_to include(admin_bob, admin_charlie)
      end
    end

    context 'when a matching email is given' do
      it 'returns administrators with emails that match the query' do
        expect(described_class.search_by_keyword('bob@example.com')).to include(admin_bob)
        expect(described_class.search_by_keyword('bob@example.com')).not_to include(admin_alice, admin_charlie)
      end
    end

    context 'when a partial match is given' do
      it 'returns administrators with universal_ids or emails that contain the query' do
        expect(described_class.search_by_keyword('lice')).to include(admin_alice)
        expect(described_class.search_by_keyword('uilder')).to include(admin_bob)
        expect(described_class.search_by_keyword('hoco')).to include(admin_charlie)
      end
    end

    context 'when no match is found' do
      it 'returns an empty collection' do
        expect(described_class.search_by_keyword('nonexistent')).to be_empty
      end
    end
  end
end
