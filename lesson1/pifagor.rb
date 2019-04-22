puts "enter sides A B C"

sides = gets.chomp.split(' ').map(&:to_f)
a, b, c = sides.sort

right_triangle = c**2 == a**2 + b**2
if right_triangle && a == b
  puts 'прямоугольный и равнобедренный'
elsif right_triangle 
  puts 'прямоугольный'
elsif a == c
  puts 'равносторонний'
end

		
