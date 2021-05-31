class AmazonScrape::Deal
  attr_accessor :name, :price, :url, :description

  @@all = []
  def initialize(name: nil, price: nil, url: nil, description: nil)
    @name = name
    @price = price
    @url = url
    @description = description
    self.class.all << self
  end

  def self.all
    @@all
  end

end
