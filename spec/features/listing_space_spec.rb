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

    scenario 'date from cannot be in the past when listing a space' do
      sign_up
      list_a_space(date_from: Date.new(2016,06,29), date_to: Date.new(2016,06,30))
      expect(page).to have_content("Value must be 30/06/2016 or later")
      expect(page).to have_content("Value must be 01/07/2016 or later")
    end

    scenario 'date to cannot be before date from date when listing a space' do
      # TBC
    end

end

# def list_a_space(name: 'My beautiful home',
# 									description: 'It has wifi',
# 									price: '100',
# 									date_from: Date.new(2016,07,20),
# 									date_to: Date.new(2016,07,27),
# 									user_id: 1)
# 	visit('/spaces')
#   click_button 'List a Space'
#   expect(current_path).to eq('/spaces/new')
#   fill_in :name, with: name
#   fill_in :description, with: description
#   fill_in :price, with: price
#   fill_in :date_from, with: date_from
#   fill_in :date_to, with: date_to
#   click_button 'List my Space'
# end
