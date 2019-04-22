puts "enter coefficient A B C"

coef = gets.chomp.split(' ').map(&:to_f)
a, b, c = coef


d = b**2 - 4 * a * c



if d > 0
  d_sqrt = Math.sqrt(d)
  x1 = (-b + d_sqrt) / (2.0 * a)
  x2 = (-b - d_sqrt) / (2.0 * a)
  puts "x1 = #{x1}, x2 = #{x2}"
elsif d == 0
  puts x = -b / (2.0 * a)
elsif d < 0
  puts "No roots"
end 

