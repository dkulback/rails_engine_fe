require 'rails_helper'

RSpec.describe Merchant do
  let(:merchant) { Merchant.new({ id: 1, attributes: { name: 'Michael' } }) }
  describe 'initialize' do
    it 'exists' do
      actual = merchant
      expected = Merchant
      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a name' do
      actual = merchant.name
      expected = 'Michael'

      expect(actual).to eq(expected)
    end
    it 'has a id' do
      actual = merchant.id
      expected = 1

      expect(actual).to eq(expected)
    end
  end
end
