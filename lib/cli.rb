class CLI

  def initialize
    Ticker.all << create_ticker("dji")
    Ticker.all << create_ticker("inx")
    Ticker.all << create_ticker("rut")
    Ticker.all << create_ticker("xwd")
  end

  def call
    loop do
      puts "Enter any ticker symbol, 'list' for some examples, or 'exit':"
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
    puts "Please enter a number to see more or 'exit' to go back:"
    input = gets.strip.downcase
    return if input == 'exit'
    input = Ticker.all[input.to_i-1].ticker
    display_ticker(input)
  end

  def display_ticker(input)
    ticker = create_ticker(input)
    ticker.display
    puts "Would you like to view the webpage for more details (y/n)?:"
    input = gets.strip.downcase
    system("open -a Safari #{ticker.url}") if input == "y"
  end

  def create_ticker(input)
    ticker_data = Scraper.scrape_ticker_page(input)
    Ticker.new(ticker_data)
  end

end
