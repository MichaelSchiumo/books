class BestBooks::CLI 

  def call
    puts 'Welcome to Best Books'
    #display a list of books
    BestBooks::Book.all.each.with_index(1) do |book, i|
       puts "#{i}. #{book.title}"
    end
    
    #let the user give input
    puts "Enter which book you'd like to see:"
    
    input = gets.strip
    
    #find book based on input and display that book's information
    
    #if input is bad, loop back and ask again
    
    #exit should be an option at any point
  end

end