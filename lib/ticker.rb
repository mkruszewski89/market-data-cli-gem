class Ticker
  attr_accessor :ticker, :name, :price, :day_change, :url

  @@all = []

  def self.all
    @@all
  end

  def initialize(ticker:, name:, price:, day_change:, url:)
    self.ticker = ticker
    self.name = name
    self.price = price
    self.day_change = day_change
    self.url = url
  end

  def display
    puts "#{ticker}  |  #{name}  |  #{price}  |  #{day_change}"
  end

end
