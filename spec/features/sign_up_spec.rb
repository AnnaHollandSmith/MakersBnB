feature 'User Sign Up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, tim.chipperfield@gmail.com')
    expect(User.first.email).to eq('tim.chipperfield@gmail.com')
  end
end

def sign_up
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: 'tim.chipperfield@gmail.com'
    fill_in :password, with: 'christmastrees'
    click_button 'Sign Up'
end
