class CLI

  def initialize
    Ticker.all << create_ticker("dji")
    Ticker.all << create_ticker("inx")
    Ticker.all << create_ticker("rut")
    Ticker.all << create_ticker("xwd")
  end

  def call
    input = nil
    loop do
      puts "Enter a ticker symbol, 'list' for some examples, or 'exit':"
      input = gets.strip.downcase
      case input
      when 'exit'
        break
      when 'list'
        list
      else
        display_ticker(input)
      end
    end
    puts "Goodbye!"
  end

  def list
    Ticker.all.each_with_index {|ticker, index|
      puts "#{index+1}. #{ticker.ticker}  |  #{ticker.name}"
    }
    puts "Please enter a number for more details or 'exit':"
    input = gets.strip.downcase
    return if input == 'exit'
    index = input.to_i - 1
    puts index
    #Ticker.all[index] build out more data points
  end

  def create_ticker(input)
    ticker_data = Scraper.scrape_ticker_page(input)
    Ticker.new(ticker_data)
  end

  def display_ticker(input)
    ticker = create_ticker(input)
    ticker.display
  end

end
