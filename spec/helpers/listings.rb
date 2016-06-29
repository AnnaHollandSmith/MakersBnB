def list_a_space
  click_button 'List a Space'
  expect(current_path).to eq('/spaces/new')
  fill_in 'name', with: 'My beautiful home'
  fill_in 'description', with: 'It has wifi'
  fill_in 'price', with: '100'
  fill_in 'date_from', with: Date.new(2016,07,20)
  fill_in 'date_to', with: Date.new(2016,07,21)
  click_button 'List my Space'
end
