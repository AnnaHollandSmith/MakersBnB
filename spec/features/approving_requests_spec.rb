feature 'the user can approve requests' do

  scenario 'user sees pending requests' do
    request_and_approval
    expect(page).to have_content('My beautiful home')
  end

  scenario 'user can deny request' do
    request_and_approval
    click_button('See this request')
    click_button('Deny Request')
    expect(page).to have_content('Request Denied')
  end

end
