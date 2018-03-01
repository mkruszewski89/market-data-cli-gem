class Ticker
  attr_accessor :ticker, :name, :price, :day_change

  @@all = []

  def self.all
    @@all
  end

  def initialize(ticker:, name:, price:, day_change:)
    self.ticker = ticker
    self.name = name
    self.price = price
    self.day_change = day_change
  end

  def display
    puts "#{ticker}  |  #{name}  |  #{price}  |  #{day_change}"
  end

  def add_to_list
    self.class.all << self
  end

end
