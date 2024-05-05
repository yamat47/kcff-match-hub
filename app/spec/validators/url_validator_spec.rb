# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlValidator do
  subject(:dummy_instance) { dummy_model.new(url:) }

  let(:dummy_model) do
    Struct.new(:url) do
      include ActiveModel::Validations

      def self.name
        'DummyModel'
      end

      validates :url, url: { host: /(youtube\.com|youtu\.be)\Z/i }
    end
  end

  context 'when the URL is blank' do
    let(:url) { '' }

    it 'is valid' do
      expect(dummy_instance).to be_valid
    end
  end

  context 'when the URL uses https scheme' do
    let(:url) { 'https://youtube.com/watch?v=dQw4w9WgXcQ' }

    it 'is valid' do
      expect(dummy_instance).to be_valid
    end
  end

  context 'when the URL does not use https scheme' do
    let(:url) { 'http://youtube.com/watch?v=dQw4w9WgXcQ' }

    it 'is invalid' do
      expect(dummy_instance).not_to be_valid
      expect(dummy_instance.errors[:url]).to include(match(/はhttpsのみ有効です/))
    end
  end

  context 'when the URL host matches the specified host' do
    let(:url) { 'https://youtu.be/dQw4w9WgXcQ' }

    it 'is valid' do
      expect(dummy_instance).to be_valid
    end
  end

  context 'when the URL host does not match the specified host' do
    let(:url) { 'https://example.com/watch?v=dQw4w9WgXcQ' }

    it 'is invalid' do
      expect(dummy_instance).not_to be_valid
      expect(dummy_instance.errors[:url]).to include(match(/は許可されていないホストです/))
    end
  end

  context 'when the URL is invalid' do
    let(:url) { 'javascript:console.log("this is evil script");' }

    it 'is invalid' do
      expect(dummy_instance).not_to be_valid
      expect(dummy_instance.errors[:url]).to include(match(/は不正な値です/))
    end
  end
end
