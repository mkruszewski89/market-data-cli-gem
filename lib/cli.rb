class CLI

  def call
    input = nil
    loop do
      puts "Enter a ticker symbol or 'exit':"
      input = gets.strip.downcase
      break if input == 'exit'
      ticker_data = Scraper.scrape_ticker_page(input)
      ticker = Ticker.new(ticker_data)
      ticker.display
    end
    puts "Goodbye!"
  end

end
