letters = {}
ind = 0

('a'..'z').each {|x| letters[x] = ind += 1 }

let = letters.keep_if { |a, b| a =~ /[aeiou]/ }
 
puts let
