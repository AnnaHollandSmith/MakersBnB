module Helpers

  def format_price(price)
      "£" + sprintf("%0.02f", price)
  end


  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def get_request_status(number)
  	messages= {
  		0 => 'Not confirmed',
  		1 => 'Denied',
  		2 => 'Confirmed'
  	}
  	messages[number]
  end

  def unconfirmed?(request)
  	request.confirmed == 0
  end

  def validate_request_dates(date_from, date_to, space_id)
    if date_from > date_to
      flash.next[:errors] = ['Invalid date range!']
      redirect('/spaces/' + space_id)
    end
  end
  
end
