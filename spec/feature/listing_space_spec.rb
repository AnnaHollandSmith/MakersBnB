feature 'Listing spaces' do
    scenario 'user can list a space' do

      visit '/spaces'
      expect(page.status_code).to eq 200
      click_button 'List a Space'
      expect(current_path).to eq('/spaces/new')
      fill_in 'Name', with: 'My beautiful home'
      click_button 'List my Space'
      expect(current_path).to eq('/spaces')

      within'ul#spaces' do
        expect(page).to have_content('My beautiful home')
      end
    end
end
