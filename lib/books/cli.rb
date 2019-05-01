require 'pry'

  class BestBooks::CLI

  # def call
  #   puts 'Welcome to Best Books'
  #   #scrape to create books
  #
  #   BestBooks::Scraper.new.make_books
  #
  #   #display a list of books
  #   # BestBooks::Book.all.each do |book|
  #   #    puts "#{book.rank}. #{book.title}"
  #   end

    #let the user give input


    def call
      BestBooks::Scraper.new.make_books
      list_books
      menu
      goodbye
    end

    def list_books
      puts "Welcome to Best Books!"
      #should these be instance variables
      @books = BestBooks::Book.all
      @books.each.with_index(1) do |book, i|
        puts "#{i}.#{book.title} - #{book.author}"
      end
    end

    def menu
      input = nil
      while input != "exit"
        puts "Enter which book you'd like to see:"
        input = gets.strip

        if input.to_i > 0
          book = BestBooks::Book.find_by_index(input.to_i-1)
          puts "#{book.title} by: #{book.author}, ranked: #{book.rank}"
        elsif input == "list"
          list_books
        else
          puts "Sorry, we didn't catch that. Please select a book:"
        end
      end
    end

    def goodbye
      puts "Thank you for visiting Best Books!"
    end
end










#     #find book based on input and display that book's information
#     input = nil
#     while input != "exit"
#       puts "Enter which book you'd like to see:"
#       input = gets.strip
#
#       if input.to_i > 0
#         book = BestBooks::Book.find_by_index(input.to_i-1)
#       end
#     end
#
#     puts ""
#     puts "Would you like to see another book? Enter Y or N:"
#     input = gets.strip
#     if input == 'y'
#       list_books
#     elsif input == 'n'
#       goodbye
#     else
#       puts "Sorry, we didn't catch that. Please enter Y or N:"
#     end
#   end
#
#     #if input is bad, loop back and ask again
#
#
#
#   def print(book)
#     puts "#{book.title} by: #{book.author}"
#     puts "#{book.summary}"
#   end
#
#   def goodbye
#     puts "Thank you for visiting Best Books!"
#   end
# end
