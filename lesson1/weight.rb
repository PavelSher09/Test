puts "Whats your name?"
name = gets.chomp
puts "What is your height?"
height = gets.chomp.to_i
puts "what is your weight?"
weight = gets.chomp.to_i
if height - 110 <= weight
  puts "#{name}, your height is #{height} and u should go to gym"
else
  puts "#{name}, your height is #{height} and your weight is optimal"
end
