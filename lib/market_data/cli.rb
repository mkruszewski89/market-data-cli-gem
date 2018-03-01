class MarketData::CLI

  def call
    input = nil
    while input != 'exit'
      puts "Enter a ticker symbol or 'exit':"
      input = gets.strip.downcase
      display(input)
    end
    puts "Goodbye!"
  end

  def display(input)
    puts <<-DOC
      Ticker | Full_Name | Price | 1-day % | 3-month % | 1-year %
    DOC
  end

end
