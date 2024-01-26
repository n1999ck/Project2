# Nick Miller
# Six Little Words in Ruby
# Project 2b
# 25 January 2024
class SixLittle
  
  #collection attribute for words, hints
  @words = []
  @hints = []
  @tokens = []

  def initialize
    @words = []
    @hints = []
    @tokens = []
  end
  # Ask
  def ask
    6.times do
      puts "Enter word: "
      @word = gets.chomp
      while @word.length < 4 do
        puts "Please enter a word over 4 characters long!"
        @word = gets.chomp
      end
      puts "Enter hint for word: "
      @hint = gets.chomp
      @words << @word
      @hints << @hint
    end
    #Get 6 pairs of string inputs
    #a word of 4+ characters length plus a related hint string
  end

  # Prepare
  def prepare
    # break each word in half (be consistent for odd numbers)
    @words.each do |key|
      if key.size % 2 == 0
        @midpoint = key.size/2
      else
        @midpoint = key.size/2 - 0.5
      end
      # https://stackoverflow.com/questions/1020568/how-to-convert-a-string-to-lower-or-upper-case-in-ruby
      # https://www.rubyguides.com/2018/01/ruby-string-methods/
      @token1 = key[0..@midpoint].to_s
      @tokens << @token1.upcase
      @token2 = key[@midpoint..-1].to_s
      @tokens << @token2.upcase
    end
    # capitalize broken parts
    # add parts to tokens
    # shuffle tokens
    @tokens.shuffle!
  end

  # Display
  def display
    #Display the title
    puts "\n\nSix Little Words (Ruby)\n"
    # display table of tokens, 4 words across in 3 rows
    # https://try.ruby-lang.org/playground/#code=&engine=cruby-3.2.0 - used to mess with this stuff quickly
    # https://stackoverflow.com/questions/8723120/how-to-print-something-without-a-new-line-in-ruby
    puts "\nPartial Words:"
    (0..@tokens.size).each { |n|
      print "#{@tokens[n]} "
      if n ==3 || n == 7
        puts
      end
    }

    puts "\n\nHints:"
    @hints.each { |hint| puts hint}

    # display answer key
    # https://stackoverflow.com/questions/3554344/what-is-ruby-equivalent-of-pythons-s-hello-s-where-is-s-john-mar
    puts "\nANSWER KEY: "
    (0..@words.size).each { |n|
      print "#{@words[n]} "
      if n == 2
        puts
      end
    }
    puts "\n"
  end
  
  # Run
  def run
    #clear all collections
    # call ask
    self.ask
    # call prepare
    self.prepare
    # call display
    self.display
  end
end
