require 'open-uri'
require 'nokogiri'
require 'pry'


class BestBooks::Scraper

  def get_page
    Nokogiri::HTML(open("https://thegreatestbooks.org/"))
  end

  def scrape_books_index
    get_page.css("li.item div.row div.col-xs-12")
  end

  def make_books
    scrape_books_index.each do |b|
      BestBooks::Book.new_from_index_page(b)
    end
  end

  def scrape_summary(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('p').first.text.strip
  end
end
