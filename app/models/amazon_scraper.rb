require 'open-uri'
require 'mechanize'

class AmazonScraper
  AMAZON_URL = "http://www.amazon.com/s/field-keywords="

  # For simplicity I take only first page, otherwise I need to add and configure some 
  # framework to support background jobs in order to pararel requests to reduce search time
  def get_prices_for(product_name)
    prices = []
    page = Mechanize.new.get(url(product_name)) rescue nil
    return prices unless page.present? && page.body.present?

    doc = Nokogiri::HTML(page.body)
    
    doc.css(".a-fixed-left-grid-inner").each do |item|
      prices << item.at_css(".s-price").try(:text)
    end if doc.present?

    prices.compact
  end

  private
  def url(product_name)
    AMAZON_URL + product_name
  end
end