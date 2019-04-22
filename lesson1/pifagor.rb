puts "enter sides A B C"

sides = gets.chomp.split(' ').map(&:to_f)
a, b, c = sides.sort
puts "Треугольник прямоугольный" if c**2 == a**2 + b**2
puts "Треугольник равнобедренный" if (a == b) || (b == c) || (a == c)
puts " и равносторонний" if (a == b) && (b == c) && (a == c)



		
