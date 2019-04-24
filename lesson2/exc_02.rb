array = []
i = 5
until i >= 100
  i +=5
  array.push(i)
end
puts array

arr2 = (10..100).step(5).to_a
puts arr2
