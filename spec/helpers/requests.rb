def request_and_approval
  sign_up(email: 'tim.chipperfield@gmail.com', password: '123', password_confirmation: '123' )
  list_a_space
  click_button('Sign out')

  sign_up(email: 'kasia@kasia.com', password: '123', password_confirmation: '123' )
  make_request
  click_button('Sign out')

  sign_in(email: 'tim.chipperfield@gmail.com', password: '123')
  click_button 'My Profile'
end
