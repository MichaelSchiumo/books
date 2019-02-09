class BestBooks::Book


  attr_accessor :title, :author, :rank

  @@all = []

  def initialize(title = nil, author = nil, rank = nil)

  @title = title 
  @author = author
  @rank = rank 
  @@all << self 
  end

  def self.all 
    @@all
  end 
  
  def self.new_from_index_page(book_html)
    binding.pry
    name = book_html.css('h4').split(' by ')[0].strip
    author = book_html.css('h4').split(' by ')[1].strip
    binding.pry
    rank = book_html.css('h4').split('\n')[0].strip
    self.new(name, author, rank)
  end

end  










