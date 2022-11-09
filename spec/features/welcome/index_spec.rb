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
        expect(current_path).to eq(merchants_search_path)
      end

      within '.item-search' do
        expect(page).to have_content('Search Items')
        fill_in 'i-search', with: 'Baseball'
        expect(current_path).to eq(items_search_path)
      end
    end
  end
end
