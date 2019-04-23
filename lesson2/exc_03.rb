
  
fibs = [0,1]
nxt = 1

while nxt < 100
  fibs << nxt
  nxt = fibs[-2] + fibs[-1]
end
puts fibs