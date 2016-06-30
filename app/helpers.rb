module Helpers

  def format_price(price)
      "£" + sprintf("%0.02f", price)
  end


  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def validate_space_availability(date_from, date_to, route)
    if date_from > date_to
      flash.next[:errors] = ['Invalid date range!']
      redirect(route)
    end
  end

end
