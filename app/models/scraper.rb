class Scraper

  def initialize(market)
    @scraper = Scraper.for(market)
  end

  def self.for(market)
    # market is for future usage, now we have only one market place(Amazon)
    # when we have more markets put here logic to instantiate relevant scraper
    AmazonScraper.new
  end

  def get_prices_for(product_name)
    @scraper.get_prices_for(product_name)
  end
end
