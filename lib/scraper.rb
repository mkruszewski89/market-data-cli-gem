class Scraper

  def self.scrape_ticker_page(input)
    url = "https://finance.google.com/finance?q=" + input
    doc = Nokogiri::HTML(open(url))
    ticker_data = {}
    ticker_data[:ticker] = input.upcase
    ticker_data[:url] = url
    ticker_data[:name] = doc.css(".elastic").first.css("h3").first.text
    ticker_data[:price] = doc.css(".elastic").first.css(".pr").text.gsub("\n",'')
    ticker_data[:day_change] = doc.css(".elastic").first.css(".id-price-change").text.gsub("\n",'')
    ticker_data
  end

end
