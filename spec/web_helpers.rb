def sign_up(email: 'tim.chipperfield@gmail.com', password: 'christmastrees', password_confirmation: 'christmastrees' )
    visit '/'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
end


def list_a_space
  click_button 'List a Space'
  expect(current_path).to eq('/spaces/new')
  fill_in 'Name', with: 'My beautiful home'
  fill_in 'Description', with: 'It has wifi'
  fill_in 'Price', with: '100'
  click_button 'List my Space'
end
