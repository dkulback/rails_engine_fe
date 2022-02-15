require 'rails_helper'

RSpec.describe ItemClient do
  let(:client) { ItemClient }
  describe '::get_merchants' do
    it 'returns a json list of items' do
      VCR.use_cassette('items') do
        items = client.get_items
        item = items[:data].first
        expect(items).to be_a Hash
        expect(items[:data]).to be_a Array
        expect(item).to be_a Hash
        expect(item).to have_key(:attributes)
        expect(item[:attributes][:name]).to be_a String
        expect(item[:attributes][:description]).to be_a String
        expect(item[:attributes][:unit_price]).to be_a Float
        expect(item[:attributes][:merchant_id]).to be_a Integer
        expect(item[:id]).to be_a String
      end
    end
  end
  describe '::get_items' do
    it 'returns a response of items' do
      VCR.use_cassette('item') do
        item = client.get_item(4)
        expect(item).to be_a Hash
      end
    end
  end
end
