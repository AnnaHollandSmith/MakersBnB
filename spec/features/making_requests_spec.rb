feature 'Making requests' do
  
  scenario 'clicking a listing takes you to listings individual page' do
    sign_up
    list_a_space
    click_button 'Sign out'
    sign_up(email: 'bob@gmail.com', password: 'password', password_confirmation: 'password')
    make_request
    expect(current_path).to eq('/requests')
    expect(page).to have_content('Your booking request has been sent')
  end

end