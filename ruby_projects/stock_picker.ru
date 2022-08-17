ary = [5, 7, 9, 2, 4, 7, 8, 2, 4, 5, 1, 0]

def most_profit(stock_price_each_day)
  most_profit = 0

  stock_price_each_day.each_with_index do |buy_price, idx_buy|
    stock_price_each_day.each_with_index do |sell_price, idx_sell|
      next unless idx_buy < idx_sell

      profit = check_profit(buy_price, sell_price)
      most_profit = profit if profit > most_profit
    end
  end

  most_profit
end

def check_profit(buy_day, sell_day)
  sell_day - buy_day
end

def best_buy_and_sell_day(stock_price_each_day)
  stock_price_each_day.each_with_index do |buy_price, idx_buy|
    stock_price_each_day.each_with_index do |sell_price, idx_sell|
      next unless idx_buy < idx_sell

      profit = check_profit(buy_price, sell_price)
      if profit == most_profit(stock_price_each_day)
        best_days = [idx_buy.to_i, idx_sell.to_i]
        p best_days
      end
    end
  end
end

best_buy_and_sell_day(ary)
