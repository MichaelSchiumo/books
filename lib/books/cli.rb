class BestBooks::CLI

  def call
    puts 'Welcome to Best Books'
    #scrape to create books
    binding.pry
    BestBooks::Scraper.new.make_books

    #display a list of books
    BestBooks::Book.all.each do |book|
       puts "#{book.rank}. #{book.title}"
    end

    #let the user give input
    puts "Enter which book you'd like to see:"

    input = gets.strip

    #find book based on input and display that book's information

    #if input is bad, loop back and ask again

    #exit should be an option at any point
  end

  def print(book)
    puts "#{book.title } by: #{book.author}"

  end

end
