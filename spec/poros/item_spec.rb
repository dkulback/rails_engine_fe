require 'rails_helper'

RSpec.describe Item do
  let(:item) do
    Item.new({
               "id": '4',
               "type": 'item',
               "attributes": {
                 "name": 'Item Nemo Facere',
                 "description": 'Sunt eum id em.',
                 "unit_price": 42.91,
                 "merchant_id": 1
               }
             })
  end
  describe 'initialize' do
    it 'exists' do
      actual = item
      expected = Item
      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a name' do
      actual = item.name
      expected = 'Item Nemo Facere'

      expect(actual).to eq(expected)
    end
    it 'has a id' do
      actual = item.id
      expected = '4'

      expect(actual).to eq(expected)
    end
    it 'has a description' do
      actual = item.description
      expected = 'Sunt eum id em.'

      expect(actual).to eq(expected)
    end
    it 'has a unit_price' do
      actual = item.unit_price
      expected = 42.91

      expect(actual).to eq(expected)
    end
    it 'has a merchant_id' do
      actual = item.merchant_id
      expected = 1

      expect(actual).to eq(expected)
    end
  end
end
