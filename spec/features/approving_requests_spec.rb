feature 'the user can approve requests' do

  scenario 'user sees pending requests' do
    sign_up(email: 'tim.chipperfield@gmail.com',
            password: '123',
            password_confirmation: '123')
    list_a_space
    click_button 'Sign out'
    
    sign_up(email: 'bob@gmail.com',
            password: 'password',
            password_confirmation: 'password')
    make_request
    click_button 'Sign out'

    sign_in(email: 'tim.chipperfield@gmail.com',
            password: '123')
    click_link 'Requests'
    expect(page).to have_content('My beautiful home')
  end

  # scenario 'user can deny request' do
  #   request_and_approval
  #   click_button('See this request')
  #   click_button('Deny Request')
  #   expect(page).to have_content('Request Denied')
  # end

end
