require 'rails_helper'

RSpec.describe 'merchants show spec' do
  it 'has the merchants name and their items' do
    merchant = Merchant.new(id: 1, attributes: { name: 'Schroeder-Jerde' })
    VCR.use_cassette('merchant_items_show') do
      visit merchant_path(merchant.id)
      within '.merchant' do
        expect(page).to have_content('Merchant: Schroeder-Jerde')
      end
      within '.items' do
        expect(page).to have_content('Item Nemo Facere')
        expect(page).to have_content('Expedita Aliquam')
        expect(page).to have_content('Item Provident At')
      end
    end
  end
end
