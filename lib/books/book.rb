class BestBooks::Book


  attr_accessor :title, :author, :rank, :summary, :url

  @@all = []

  def initialize(title, author, rank, url)

  @title = title
  @author = author
  @rank = rank
  @url = url
  @@all << self
  save
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all.uniq << self
  end

  def self.find_by_index(index)
    @@all[index]
  end


  #parse with new selector

  # def self.new_from_index_page(book_html)
  #   binding.pry
  #   name = book_html.css("div div div h4 a:nth-child(1)")
  # end

#@@all.uniq

  def self.new_from_index_page(book_html)
    name_and_author = book_html.css('h4').text.split('. ')[1].strip
    name = name_and_author.split(' by ')[0].strip
    author = name_and_author.split(' by ')[1]
    rank = book_html.css('h4').text.split('. ')[0].strip
    #summary = book_html.css('p').text.strip
    url = "https://thegreatestbooks.org#{book_html.css('a').first.attr('href')}"
    self.new(name, author, rank, url)
  end

  def summary
    @summary ||= BestBooks::Scraper.new.scrape_summary(url)
  end

end
