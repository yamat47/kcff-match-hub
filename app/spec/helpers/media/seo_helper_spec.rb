# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Media::SeoHelper do
  describe '#media_page_title' do
    context 'when title is nil' do
      subject { helper.media_page_title(nil) }

      it { is_expected.to eq '関東学生フットボールクラブ連盟 公式サイト' }
    end

    context 'when title is empty string' do
      subject { helper.media_page_title('') }

      it { is_expected.to eq '関東学生フットボールクラブ連盟 公式サイト' }
    end

    context 'when title is present' do
      subject { helper.media_page_title('タイトル') }

      it { is_expected.to eq 'タイトル｜関東学生フットボールクラブ連盟 公式サイト' }
    end
  end
end
