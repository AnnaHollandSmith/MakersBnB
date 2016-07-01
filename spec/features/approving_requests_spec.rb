feature 'the user can approve requests' do

  scenario 'user sees pending requests' do
    list_request_make_request_view
    expect(page).to have_content('My beautiful home')
  end

  scenario 'user can see individual request' do
    list_request_make_request_view
    click_button 'See this Request'
    expect(page).to have_content("Request for 'My beautiful home'")
    expect(page).to have_content("From: bob@gmail.com")
  end

  scenario 'user can see individual request' do
    list_request_make_request_view
    expect(page).to have_content('My beautiful home')
    click_button 'See this Request'
    expect(page).to have_content("Request for 'My beautiful home'")
    expect(page).to have_content("From: bob@gmail.com")
  end

  scenario 'user can confirm request' do
    list_request_make_request_view
    expect(page).to have_content('My beautiful home')
    click_button 'See this Request'
    click_button 'Confirm Request from bob@gmail.com'
    expect(current_path).to eq('/requests')
    expect(page).to have_content('Status: Confirmed')
  end

  scenario 'user can deny request' do
    list_request_make_request_view
    expect(page).to have_content('My beautiful home')
    click_button 'See this Request'
    click_button 'Deny Request from bob@gmail.com'
    expect(current_path).to eq('/requests')
    expect(page).to have_content('Status: Denied')
  end

end
