# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SeoHelper do
  describe '#admin_page_title' do
    context 'when title is nil' do
      subject { helper.admin_page_title(nil) }

      it { is_expected.to eq 'KCFF 管理画面' }
    end

    context 'when title is empty string' do
      subject { helper.admin_page_title('') }

      it { is_expected.to eq 'KCFF 管理画面' }
    end

    context 'when title is present' do
      subject { helper.admin_page_title('タイトル') }

      it { is_expected.to eq 'タイトル｜KCFF 管理画面' }
    end
  end
end
