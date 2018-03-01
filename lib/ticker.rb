class Ticker
  attr_accessor :ticker, :name, :price, :day_change

  def initialize(ticker:, name:, price:, day_change:)
    self.ticker = ticker
    self.name = name
    self.price = price
    self.day_change = day_change
  end

  def display
    puts "#{ticker}  |  #{name}  |  #{price}  |  #{day_change}"
  end

end
