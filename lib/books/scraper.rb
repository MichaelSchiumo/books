require 'open-uri'
require 'nokogiri'
require 'pry'


class BestBooks::Scraper

  def get_page
    Nokogiri::HTML(open("https://thegreatestbooks.org/"))
  end

  def scrape_books_index
    get_page.css("body div:nth-child(2) div div.col-sm-7 div.list-body ol li.item.pb-3.pt-3.border-bottom")
  end

  def make_books
    scrape_books_index.uniq.each do |b|
    BestBooks::Book.new_from_index_page(b)
    end
  end

  def scrape_summary(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('p').first.text.strip
  end
end
