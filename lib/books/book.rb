class BestBooks::Book


  attr_accessor :title, :author, :price

  @@all = []

  def initialize(title = nil, author = nil, price = nil)

  @title = title 
  @author = author
  @price = price 
  @@all << self 
  end

  def self.all 
    @@all 
  end 


end  










