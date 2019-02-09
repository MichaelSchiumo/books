require 'open-uri'
require 'nokogiri'
require 'pry'


class BestBooks::Scraper

  def get_page
    Nokogiri::HTML(open("https://thegreatestbooks.org/"))
  end

  def scrape_books_index(index_url)
   
  end 

  def make_books 
    scrape_books_index.each do |b|
      BestBooks::Books.new_from_index_page(b)
    end
  end
end     