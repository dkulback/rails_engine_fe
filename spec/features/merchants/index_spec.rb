require 'rails_helper'

RSpec.describe 'Merchants Index' do
  it 'displays all the merchants' do
    VCR.use_cassette('merchants_index') do
      visit merchants_path

      within '.merchants' do
        expect(page).to have_content('Schroeder-Jerde')
        expect(page).to have_content('Klein, Rempel and Jones')

        click_link 'Schroeder-Jerde'

        expect(current_path).to eq(merchant_path(1))
      end
    end
  end
end
