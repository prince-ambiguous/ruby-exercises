ary = [5,7,9,2,4,7,8,2,4,5,1,0]


def most_profit(stock_price_each_day)
    most_profit = 0

    stock_price_each_day.each_with_index do |buy_price, idx_buy|
        stock_price_each_day.each_with_index do |sell_price, idx_sell|

            if idx_buy < idx_sell
                profit = check_profit(buy_price,sell_price)
                if profit > most_profit
                    most_profit = profit
                end
            end
        end
    end

    most_profit
end

def check_profit(buy_day, sell_day)
    profit = sell_day - buy_day
    profit
end

def best_buy_and_sell_day(stock_price_each_day)
    stock_price_each_day.each_with_index do |buy_price, idx_buy|
        stock_price_each_day.each_with_index do |sell_price, idx_sell|
           if idx_buy < idx_sell
                profit = check_profit(buy_price,sell_price)
                if profit == most_profit(stock_price_each_day)
                    best_days = [ idx_buy.to_i, idx_sell.to_i]
                    p best_days
                end
           end
        end
    end
end

    

best_buy_and_sell_day(ary)