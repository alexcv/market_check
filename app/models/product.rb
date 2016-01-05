class Product

  def self.search_by(product_name, market)
    prices = Scraper.new(market).get_prices_for(product_name)
  end

  def self.get_product_name_from_url(url)
    # example of valid ebay url:
    # http://www.ebay.com/sch/i.html?_from=R40&_trksid=p2050601.m570.l1313.TR0.TRC0.H0.Xapple+ipad+air+2.TRS0&_nkw=apple+ipad+air+2&_sacat=0
    begin
      CGI.parse(URI.parse(url).query)['_nkw'].first
    rescue StandardError => e
      nil
    end
  end
end