require 'rails_helper'

RSpec.describe MerchantServicer do
  let(:servicer) { MerchantServicer }
  describe '::merchants' do
    it 'returns a list of movies' do
      VCR.use_cassette('merchants') do
        actual = servicer.merchants[0]
        expected = Merchant
        expect(actual).to be_a(expected)
      end
    end
  end
  describe '#merchant' do
    it 'returns a Merchant' do
      VCR.use_cassette('merchant') do
        actual = servicer.merchant(1)
        expected = Merchant
        expect(actual).to be_a(expected)
      end
    end
  end
  describe '#items' do
    it 'returns a list of movies' do
      VCR.use_cassette('merchant_items') do
        actual = servicer.items(1)[0]
        expected = Item
        expect(actual).to be_a(expected)
      end
    end
  end
  describe '::search/1' do
    it 'returns a list of merchants' do
      VCR.use_cassette('merchant_search') do
        actual = servicer.search('hand')
        expected = Array
        expect(actual).to be_a(expected)
        expect(actual[0]).to be_a(Merchant)
      end
    end
  end
end
