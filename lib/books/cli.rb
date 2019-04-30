class BestBooks::CLI

  def call
    puts 'Welcome to Best Books'
    #scrape to create books

    BestBooks::Scraper.new.make_books

    #display a list of books
    BestBooks::Book.all.each do |book|
       puts "#{book.rank}. #{book.title}"
    end

    #let the user give input
    puts "Enter which book you'd like to see:"


    input = gets.strip

    if input == ''
      puts "Sorry, we didn't catch that. Please enter the number of the book that you'd like to see:"
    end

    #find book based on input and display that book's information
    if input != ''
      input = gets.strip
      book = BestBooks::Book.find(input)
      print(book)

      puts ""
      puts "Would you like to see another book? Enter 'Y' or 'N':"
      input = gets.strip.downcase
      if input = 'y'
        call
      else
        goodbye
      end
    end    


    #if input is bad, loop back and ask again

    #exit should be an option at any point
  end

  def print(book)
    puts "#{book.title} by: #{book.author}"
    puts "#{book.summary}
  end

end
