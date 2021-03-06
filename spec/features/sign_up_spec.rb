feature 'User Sign Up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, tim.chipperfield@gmail.com')
    expect(User.first.email).to eq('tim.chipperfield@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/new')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'you cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/new')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'you cannot sign up without a valid email address' do
    expect { sign_up(email: 'invalid@email')}.not_to change(User, :count)
    expect(current_path).to eq('/new')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I cannot sign up with an existing email address" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
