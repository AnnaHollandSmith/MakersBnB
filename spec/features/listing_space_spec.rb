feature 'Listing spaces' do
    scenario 'a signed in user can list a space' do
      sign_up
      list_a_space
      expect(current_path).to eq('/spaces')

      expect(page).to have_content('My beautiful home')
      expect(page).to have_content('It has wifi')
      expect(page).to have_content('£100')
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
      attach_file 'photo', "spec/support/uploads/Hogwarts-dh2.jpg"
      click_button 'List my Space'
      spaces = Space.all
      expect(spaces.map(&:name)).to include("My ugly smelly home")
      expect(spaces.map(&:name)).to include("My beautiful home")
    end

    scenario 'can add date from and to' do
      sign_up
      list_a_space
      click_link "My beautiful home"
      expect(page).to have_content("My beautiful home")
      expect(page).to have_content("It has wifi")
      expect(page).to have_content("£100.00")
      expect(page).to have_content('Available from 2016-07-20 to 2016-07-27')
    end

    scenario 'User can upload an image' do
      sign_up
      list_a_space
      space = Space.last
      expect(space.photo).to eq "Hogwarts-dh2.jpg"
      visit "spaces/#{space.id}"
      expect(page).to have_xpath "//img[@src='/image_uploads/Hogwarts-dh2.jpg']"
  end
end
