module Helpers

  def format_price(price)
      "£" + sprintf("%0.02f", price)
  end


  def current_user
    @current_user ||= User.get(session[:user_id])
  end

end
