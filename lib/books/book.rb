class BestBooks::Book


  attr_accessor :title, :author, :rank, :summary, :url

  @@all = []

  def initialize(title = nil, author = nil, rank = nil, url = nil)

  @title = title
  @author = author
  @rank = rank
  @url = url
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
    #summary = book_html.css('p').text.strip
    url = "https://thegreatestbooks.org#{book_html.css('a').first.attr('href')}"
    self.new(name, author, rank, url)
  end

  def summary
    @summary ||= BestBooks::Scraper.new.scrape_summary(url)
  end

end
