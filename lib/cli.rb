class CLI

  def call
    input = nil
    loop do
      puts "Enter a ticker symbol, 'list', or 'exit':"
      input = gets.strip.downcase
      case input
      when 'exit'
        break
      when 'list'
        puts "Coming soon"
      else
        display_ticker(input)
      end
    end
    puts "Goodbye!"
  end

  def display_ticker(input)
    ticker_data = Scraper.scrape_ticker_page(input)
    ticker = Ticker.new(ticker_data)
    ticker.display
  end

end
