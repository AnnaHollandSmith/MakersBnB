feature 'Listing spaces' do
    scenario 'a signed in user can list a space' do
      sign_up
      list_a_space
      expect(current_path).to eq('/spaces')

      within 'ul#spaces' do
        expect(page).to have_content('My beautiful home')
        expect(page).to have_content('It has wifi')
        expect(page).to have_content('100')
      end
    end

    scenario 'signed in user can list multiple spaces' do
      sign_up
      list_a_space
      click_button 'List a Space'
      fill_in 'Name', with: 'My ugly smelly home'
      fill_in 'Description', with: 'It has no wifi but it has bugs'
      fill_in 'Price', with: '1'
      click_button 'List my Space'
      user = User.first
      expect(user.spaces.map(&:name)).to include("My ugly smelly home")
      expect(user.spaces.map(&:name)).to include("My beautiful home")
    end

end
