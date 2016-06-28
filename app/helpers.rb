module Helpers

  def format_price(price)
      "£" + sprintf("%0.02f", price)
  end

end
