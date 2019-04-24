fibs = [0,1]
next_number = 1

while next_number < 100
  fibs << next_number
  next_number = fibs[-2] + fibs[-1]
end
puts fibs
