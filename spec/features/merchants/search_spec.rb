require 'rails_helper'

RSpec.describe 'Merchants Search' do
  context 'when search includes merchant names' do
    it 'displays merchants ' do
      VCR.use_cassette('merchants_search') do
        visit root_path

        within '.merchant-search' do
          fill_in 'm-search', with: 'hand'
          click_on 'Submit'
          expect(current_path).to eq(search_merchants_path)
        end

        within '.merchants' do
          expect(page).to have_content('We found the following merchants')
          expect(page).to have_content('Hand, Boyer and Mitchell')
          expect(page).to have_content('Hand-Spencer')

          click_link 'Hand, Boyer and Mitchell'

          expect(current_path).to eq(merchant_path(48))
        end
      end
    end
  end
  context 'when search doesnt find merchants' do
    it 'displays merchants ' do
      VCR.use_cassette('merchants_search_bill') do
        visit root_path

        within '.merchant-search' do
          fill_in 'm-search', with: 'Bill'
          click_on 'Submit'
          expect(current_path).to eq(search_merchants_path)
        end

        within '.merchants' do
          expect(page).to have_content('No merchants found')
        end
      end
    end
  end
end
