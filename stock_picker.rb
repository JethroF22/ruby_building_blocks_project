def get_max_profit stock_prices, start_index
    buying_price = stock_prices[0]
    profits = {}
    selling_price_index = 1
    stock_prices[1..-1].each do |selling_price|
        profit = selling_price - buying_price
        profits[profit] = [start_index, (start_index + selling_price_index)]
        selling_price_index += 1 
    end
    max_profit = profits.keys.max
    max_profit_hash = {max_profit => profits[max_profit]}
    return max_profit_hash
end

def stock_picker stocks
    start_index = (stocks.max == stocks[0] ? 1 : 0)
    end_index = (stocks.min == stocks[-1] ? (stocks.length - 2) : (stocks.length - 1))
    max_profit_per_stock = {}
    stocks.each do |stock|
        if start_index == end_index
            break
        end
        max_profit = get_max_profit(stocks[start_index..end_index], start_index)
        max_profit_per_stock.merge!(max_profit)
        start_index += 1
    end
    max_profit = max_profit_per_stock.keys.max
    max_profit_per_stock[max_profit]
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect