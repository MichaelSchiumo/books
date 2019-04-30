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


    #find book based on input and display that book's information
    input = nil
    while input != "exit"
      puts "Enter which book you'd like to see:"
      input = gets.strip

      if input.to_i > 0
        book = BestBooks::Book.find_by_index(input.to_i-1)
        puts "#{the_book.title} - #{the_book.author} - #{the_book.rank}"
      end
    end

    puts ""
    puts "Would you like to see another book? Enter Y or N:"
    input = gets.strip.downcase
    if input == 'y'
      call
    elsif input == 'n'
      goodbye
    else
      puts "Sorry, we didn't catch that. Please enter Y or N:"
    end
  end

    #if input is bad, loop back and ask again

  def list_books
    books = BestBooks::Book.all
    books.each_with_index(1) {|book, index| puts "#{index}. #{book.title} - #{book.author} - #{book.rank}"}
    puts ""
  end  

  def print(book)
    puts "#{book.title} by: #{book.author}"
    puts "#{book.summary}"
  end

  def goodbye
    puts "Thank you for visiting Best Books!"
  end
end
