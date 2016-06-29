feature 'Listing spaces' do
    scenario 'user can list a space' do

      visit '/spaces'
      click_button 'List a Space'
      expect(current_path).to eq('/spaces/new')
      fill_in 'Name', with: 'My beautiful home'
      fill_in 'Description', with: 'It has wifi'
      fill_in 'Price', with: '100'
      click_button 'List my Space'
      expect(current_path).to eq('/spaces')

      within 'ul#spaces' do
        expect(page).to have_content('My beautiful home')
        expect(page).to have_content('It has wifi')
        expect(page).to have_content('100')
      end
    end
end
