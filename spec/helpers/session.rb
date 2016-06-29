module SessionHelpers

  def sign_in(email:, password:)
    visit('/sessions/new')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Login')
  end

  def sign_up(email: 'tim.chipperfield@gmail.com', password: 'christmastrees', password_confirmation: 'christmastrees' )
      visit '/'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign Up'
    end

end
