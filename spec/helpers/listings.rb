def list_a_space(name: 'My beautiful home',
									description: 'It has wifi',
									price: '100',
									date_from: Date.new(2016,07,10),
									date_to: Date.new(2016,07,20),
									user_id: 1)
	visit('/spaces')
  click_button 'List a Space'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :date_from, with: date_from
  fill_in :date_to, with: date_to
	attach_file 'photo', "spec/support/uploads/Hogwarts-dh2.jpg"
  click_button 'List my Space'
end


def make_request
	click_link 'My beautiful home'
	fill_in :start_date, with: Date.new(2016,07,11)
	fill_in :end_date, with: Date.new(2016,07,12)
	click_button 'Request to Book'
end

def make_invalid_date_selection
  click_link 'My beautiful home'
  fill_in :start_date, with: Date.new(2016,07,06)
  fill_in :end_date, with: Date.new(2016,07,05)
  click_button 'Request to Book'
end


