require 'pry'

  class BestBooks::CLI

    def call
      BestBooks::Scraper.new.make_books
      list_books
      menu
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
      input = ""
      while input != "exit"
        puts "Enter which book you'd like to see, or simply type 'list':"
        input = gets.strip

        if input.to_i > 0 && input.to_i <= @books.length
          book = BestBooks::Book.find_by_index(input.to_i-1)
          puts "#{book.title} by: #{book.author}, ranked: #{book.rank}"
          puts "If you'd like a summary, simply type 'summary':"
        elsif input == "list"
          list_books
        elsif input == "summary"
          puts "#{book.summary}"
        elsif input == "exit"
          goodbye
        else
          puts "Sorry, we didn't catch that. Please select a book:"
        end
      end
    end


    def goodbye
      puts "Thank you for visiting Best Books!"
    end
  end
