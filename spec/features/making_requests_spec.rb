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
    expect(page).to have_content("Requests I've Made: My beautiful home")
  end

  scenario 'user can see requests without having booked a space' do
    sign_up
    click_link 'Requests'
    expect(current_path).to eq('/requests')
    expect(page).to have_content("Requests I've Made")
  end

  scenario 'user cannot make a request outside available dates' do
    sign_up
    list_a_space
    click_button 'Sign out'
    sign_up(email: 'bob@gmail.com', password: 'password', password_confirmation: 'password')
    make_invalid_date_selection
    expect(page).to have_content('Invalid date range!')
  end

  # scenario 'user cannot make a request to book dates already booked' do
  #   list_request_make_request_view
  #   click_button 'See this Request'
  #   click_button 'Confirm Request from bob@gmail.com'
  #   click_button 'Sign out'

  #   sign_up(email: 'user3@gmail.com', password: 'password', password_confirmation: 'password')
  #   make_request
  #   expect(page).to have_content('Sorry, date has already been booked!')
  # end



end
