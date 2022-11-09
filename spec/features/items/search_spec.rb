require 'rails_helper'

RSpec.describe 'Items Search' do
  context 'when search includes merchant names' do
    it 'displays items' do
      VCR.use_cassette('items_search') do
        visit root_path

        within '.item-search' do
          fill_in 'i-search', with: 'non'
          click_on 'Submit'
          expect(current_path).to eq(search_items_path)
        end

        within '.items' do
          expect(page).to have_content('We found the following items')
          expect(page).to have_content('Alias Non Item')
          expect(page).to have_content('Item Quis Non')

          click_link 'Item Quis Non'

          expect(current_path).to eq(item_path(37))
        end
      end
    end
  end
  context 'when search doesnt find items' do
    it 'displays no items found' do
      VCR.use_cassette('items_search_ball') do
        visit root_path

        within '.item-search' do
          fill_in 'i-search', with: 'Ball'
          click_on 'Submit'
          expect(current_path).to eq(search_items_path)
        end

        within '.items' do
          expect(page).to have_content('No items found')
        end
      end
    end
  end
end
