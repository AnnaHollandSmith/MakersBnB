def list_a_space(name: 'My beautiful home',
									description: 'It has wifi',
									price: '100',
									date_from: Date.new(2016,07,20),
									date_to: Date.new(2016,07,27),
									user_id: 1)
	visit('/spaces')
  click_button 'List a Space'
  expect(current_path).to eq('/spaces/new')
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :date_from, with: date_from
  fill_in :date_to, with: date_to
  click_button 'List my Space'
end

def make_request
	click_link 'My beautiful home'
	fill_in :start_date, with: Date.new(2016,07,22)
	fill_in :end_date, with: Date.new(2016,07,23)
	click_button 'Request to Book'
end