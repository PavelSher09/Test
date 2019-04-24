months  = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "enter day, month, year"
dates = gets.chomp.split(' ').map(&:to_i)
date, month, year = dates

if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  months[1] = 29
end

day_order = date + months.take(month - 1).sum
puts day_order
