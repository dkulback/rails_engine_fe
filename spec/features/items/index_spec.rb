require 'rails_helper'

RSpec.describe 'items index page' do
  it 'lists all the items and their names' do
    VCR.use_cassette('items_index') do
      visit items_path
      within '.items' do
        expect(page).to have_content('Item Nemo Facere')
        expect(page).to have_content('Item Expedita Aliquam')
        expect(page).to have_content('Item Quo Magnam')
        expect(page).to have_content('Item Rerum Magni')

        click_link 'Item Nemo Facere'

        expect(current_path).to eq(item_path(4))
      end
    end
  end
end
