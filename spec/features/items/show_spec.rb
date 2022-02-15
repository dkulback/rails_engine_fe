require 'rails_helper'

RSpec.describe 'item show page' do
  it 'lists the items attributes' do
    VCR.use_cassette('items_show') do
      visit item_path(4)

      within '.item' do
        expect(page).to have_content('Item: Item Nemo Facere')
        expect(page).to have_content('description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.')
        expect(page).to have_content('cost: $42.91')
      end
    end
  end
end
