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
      fill_in 'name', with: 'My ugly smelly home'
      fill_in 'description', with: 'It has no wifi but it has bugs'
      fill_in 'price', with: '1'
      fill_in 'date_from', with: Date.new(2016,07,20)
      fill_in 'date_to', with: Date.new(2016,07,21)
      click_button 'List my Space'
      spaces = Space.all
      expect(spaces.map(&:name)).to include("My ugly smelly home")
      expect(spaces.map(&:name)).to include("My beautiful home")
    end

    scenario 'can add date from and to' do
      sign_up
      list_a_space
      expect(page).to have_content('Available From: 2016-07-20 Available To: 2016-07-21')
    end

end
