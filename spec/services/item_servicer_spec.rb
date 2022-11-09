require 'rails_helper'

RSpec.describe ItemServicer do
  let(:servicer) { ItemServicer }
  describe '::items' do
    it 'returns a list of items' do
      VCR.use_cassette('items') do
        actual = servicer.items[0]
        expected = Item
        expect(actual).to be_a(expected)
      end
    end
  end
  describe '#item' do
    it 'returns a Item' do
      VCR.use_cassette('item') do
        actual = servicer.item(4)
        expected = Item
        expect(actual).to be_a(expected)
      end
    end
  end
  describe '::search/1' do
    it 'returns a list of items' do
      VCR.use_cassette('item_search') do
        actual = servicer.search('non')
        expected = Array
        expect(actual).to be_a(expected)
        expect(actual[0]).to be_a(Item)
      end
    end
  end
end
