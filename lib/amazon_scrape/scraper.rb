class AmazonScrape::Scraper
  attr_accessor :base_url, :html, :document
  def initialize
    @base_url = "https://www.jbhifi.com.au/"
    html = open(@base_url)
    @document = Nokogiri::HTML(html)
  end

  def scrape_deals
    self.document.css(".product-loop").collect do |deals|
      name = deals.css(".product-tile__title").text.strip  #put the name the div from the website in there
      price = deals.css("meta[itemprop='price']").text.strip
      url = deals.css("a.product-tile").attr("href ").value.strip
      AmazonScrape::Deal.new(name: name, price: price, url: url) 
    end
    
  end

  def scrape_page(url)

    if url.include?("jbhifi.com.au")
      document = Nokogiri::HTML(open(url))
    else
    document = Nokogiri::HTML(open("#{base_url}#{url}"))
    end
  end
end



