require 'rails_helper'

RSpec.describe MerchantClient do
  let(:client) { MerchantClient }
  describe '::get_merchants' do
    it 'returns a list of merchants' do
      VCR.use_cassette('merchants') do
        merchants = client.get_merchants
        merchant = merchants[:data].first
        expect(merchants).to be_a Hash
        expect(merchants[:data]).to be_a Array
        expect(merchant).to be_a Hash
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes][:name]).to be_a String
        expect(merchant[:id]).to be_a String
      end
    end
  end
  describe '::get_items' do
    it 'returns a response of items' do
      VCR.use_cassette('merchant_items') do
        items = client.get_items(1)
        expect(items).to be_a Hash
        expect(items[:data]).to be_a Array
      end
    end
  end
  describe '::get_merchant' do
    it 'returns a response of items' do
      VCR.use_cassette('merchant') do
        merchant = client.get_merchant(1)
        expect(merchant).to be_a Hash
      end
    end
  end
end
