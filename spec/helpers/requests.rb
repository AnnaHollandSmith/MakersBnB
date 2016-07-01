def list_request_make_request_view
    sign_up(email: 'tim.chipperfield@gmail.com',
            password: '123',
            password_confirmation: '123')
    list_a_space
    click_button 'Sign out'

    sign_up(email: 'bob@gmail.com',
            password: 'password',
            password_confirmation: 'password')
    make_request
    click_button 'Sign out'

    sign_in(email: 'tim.chipperfield@gmail.com',
            password: '123')
    click_link 'Requests'
end