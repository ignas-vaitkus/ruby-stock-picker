def stock_picker(prices)
  buy_day = 0
  sale_day = 0
  profit = 0

  prices.each_with_index do |potential_buy_price, potential_buy_day|
    sale_period_start = potential_buy_day + 1
    prices[sale_period_start..-1].each_with_index do |potential_sell_price, potential_buy_sale_window|
      if (potential_sell_price - potential_buy_price) > profit
        profit = potential_sell_price - potential_buy_price
        buy_day = potential_buy_day
        sale_day = buy_day + potential_buy_sale_window + 1
      end
    end
  end

  return [buy_day, sale_day]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
