feature 'Making requests' do

  scenario 'a user can make a request for a single night' do
    sign_up
    list_a_space
    click_button 'Sign out'
    sign_up(email: 'bob@gmail.com', password: 'password', password_confirmation: 'password')
    click_link "My beautiful home"
    expect(page).to have_content("My beautiful home")
    expect(page).to have_content("It has wifi")
    expect(page).to have_content("£100.00")
  end

  scenario 'a user can make a request for a single night' do
    sign_up
    list_a_space
    click_button 'Sign out'
    sign_up(email: 'bob@gmail.com', password: 'password', password_confirmation: 'password')
    make_request
    expect(current_path).to eq('/requests')
    expect(page).to have_content('Your booking request has been sent')
    expect(page).to have_content('My beautiful home not confirmed')
  end

end
