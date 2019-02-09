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

    name_and_author = book_html.css('h4').text.split('. ')[1].strip
    name = name_and_author.split(' by ')[0].strip
    author = name_and_author.split(' by ')[1]
    rank = book_html.css('h4').text.split('. ')[0].strip
    self.new(name, author, rank)
  end

end  










