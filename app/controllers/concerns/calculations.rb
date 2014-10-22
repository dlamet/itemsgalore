module Calculations

  def calculate_gross_revenue(items)
    gross_revenue = 0.0
    items.map { |item| gross_revenue += (item.purchase_count * item.price) }
    gross_revenue
  end

end