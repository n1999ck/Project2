number_generator = Random.new
number = number_generator.rand(1..20)
# https://ruby-doc.org/core-2.4.1/Random.html
# 1..20 works as a range

puts "Guess a number between 1 and 20: "
guess = gets.chomp.to_i
# https://ruby-doc.org/docs/ruby-doc-bundle/Tutorial/part_02/user_input.html
# chomp removes newline

while guess != number
  if guess < number
    puts "Your guess was too low. Try again."
  elsif guess > number
    puts "Your guess was too high. Try again."
  end
  puts "Guess a number between 1 and 20: "
  guess = gets.chomp.to_i
end

puts "You guessed the correct number!"
