class Profitability

  def self.calculate_profitability(purchase_price_amount, listing_fee, profit_margin)
    expense = purchase_price_amount * (1 + listing_fee/100)
    (expense / (1 - profit_margin/100)).round(2)
  end
end
