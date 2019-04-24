item = {}
for_all = 0
loop do
puts "name of item"
item_name = gets.chomp.to_s
break if item_name == 'stop'
puts "price for item"
item_price = gets.chomp.to_i
puts "quantity of item"
item_quantity = gets.chomp.to_f
item[item_name] = { item_price: item_price, item_quantity: item_quantity}
end
item.each do |item_name, item_sub|
sum = item_sub[:item_price] * item_sub[:item_quantity]
puts "Item - #{item_name}, sum per item - #{sum}"
for_all += sum
end
puts "Sum for all items #{for_all}"

