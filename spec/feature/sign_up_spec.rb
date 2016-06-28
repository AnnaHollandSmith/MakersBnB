feature 'User Sign Up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    #expect(page).to have_content('Welcome, tim.chipperfield@gmail.com')
    expect(User.first.email).to eq('tim.chipperfield@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
