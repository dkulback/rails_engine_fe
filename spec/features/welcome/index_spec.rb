require 'rails_helper'

RSpec.describe 'application welcome page' do
  it 'has links to view/popular items/all merchants/all items' do
    VCR.use_cassette('welcome') do
      visit root_path

      within '.page-links' do
        expect(page).to have_link('Browse All Items')
        expect(page).to have_link('Browse All Merchants')
        expect(page).to have_link('Browse Popular Items')
        expect(page).to have_link('Browse Popular Merchants')
      end

      within '.merchant-search' do
        expect(page).to have_content('Search Merchants')
        fill_in 'm-search', with: 'Bill'
        click_on 'Submit'
        expect(current_path).to eq(search_merchants_path)
      end
    end
  end
  describe 'items search' do
    it 'routes to to items search page' do
      VCR.use_cassette('item_search_route') do
        visit root_path
        within '.item-search' do
          expect(page).to have_content('Search Items')
          fill_in 'i-search', with: 'Baseball'
          click_on 'Submit'
          expect(current_path).to eq(search_items_path)
        end
      end
    end
  end
end
