class AmazonScrape::CLI
    attr_accessor :scraper
  def initialize
    @scraper = AmazonScrape::Scraper.new        
  end
    
  def start
    puts "Welcome to daily Amazon deals :)"
    puts "Do you want to see Amazons daily deals?"
    puts "**Input [Y] for yes or input any character to exit**"

    input = gets.strip
    
    list_deals if input.downcase == "y"
  end

  def list_deals
    puts "List of daily deals...."
    scraper.scrape_deals.each.with_index(1) do |deals, index|
      puts "#{index}. #{deals.name}"
    end  
  end

  def promt_user
    puts "You don't want to miss out on these spicy deals"
    puts "Input [deals] to show the spicy deals again"
    puts "Input [exit] to quit."

    input = ""

    while input != "exit"
      input = gets.strip

      if input.to_i != 0 && input.to_i <= AmazonScrape::Deals.all.size

      end
    end
  end
end