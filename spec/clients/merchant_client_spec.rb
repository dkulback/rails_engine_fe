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
end
