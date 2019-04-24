vowels_hash = {}
vowels = ['a', 'e', 'i', 'o', 'u']

("a".."z").each.with_index(1) do |letter, index| 
  vowels_hash[letter] = index if vowels.include?(letter)

end
puts vowels_hash 
