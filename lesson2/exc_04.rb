letters = {}

("a".."z").each.with_index(1) do |letter, index| 

letters[letter] = index
letters.keep_if { |a, b| a =~ /[aeiou]/ }


end
puts letters
