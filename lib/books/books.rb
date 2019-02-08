class BestBooks::Books 


  attr_accessor :title, :author, :price, :rating, :availability 

  @@all = []

  def initialize(title = nil, author = nil, price = nil, rating = nil, availability = nil)

  @title = title 
  @author = author
  @price = price 
  @rating = rating 
  @availability = availability 
  @@all << self 
  end

  def self.all 
    @@all 
  end 


end  










end  