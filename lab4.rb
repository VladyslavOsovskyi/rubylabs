

def count_elements(arr)
  counter = 0
  arr.each { counter += 1 }
  counter
end

def contains?(arr, target)
  i = 0
  while i < arr.length
    return true if arr[i] == target
    i += 1
  end
  false
end

def get_unique(arr)
  unique_arr = []
  for elem in arr
    unique_arr << elem unless contains?(unique_arr, elem)
  end
  unique_arr
end

def sort_array(arr)
  sorted = arr.dup
  n = count_elements(sorted)
  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      if sorted[j] > sorted[j + 1]
        sorted[j], sorted[j + 1] = sorted[j + 1], sorted[j]
      end
    end
  end
  sorted
end

n = 12
ba = [3, 6, 11, 5, 6, 7, 6, 5]
al = [10, 6, 9, 5, 6, 9, 5]

all_registered = []
(1..n).each { |id| all_registered << id }

all_orders = []
ba.each { |order| all_orders << order }
al.each { |order| all_orders << order }
total_orders_count = count_elements(all_orders)

visited_clients = []
all_orders.each do |client|
  visited_clients << client unless contains?(visited_clients, client)
end
visited_clients = sort_array(visited_clients)
visited_clients_count = count_elements(visited_clients)

ba_orders_count = count_elements(ba)

ba_unique_clients = sort_array(get_unique(ba))
ba_unique_count = count_elements(ba_unique_clients)

al_orders_count = count_elements(al)

al_unique_clients = sort_array(get_unique(al))
al_unique_count = count_elements(al_unique_clients)

both_types_clients = []
ba_unique_clients.each do |client|
  both_types_clients << client if contains?(al_unique_clients, client)
end
both_types_clients = sort_array(both_types_clients)
both_types_count = count_elements(both_types_clients)

not_visited_clients = []
all_registered.each do |client|
  not_visited_clients << client unless contains?(visited_clients, client)
end
not_visited_clients = sort_array(not_visited_clients)
not_visited_count = count_elements(not_visited_clients)

puts 'Lab №4: Масиви та Цикли'
puts "Загальна кількість постійних клієнтів (N): #{n}"
puts "Безалкогольні замовлення (ba): #{ba.inspect}"
puts "Алкогольні замовлення (al):    #{al.inspect}"
puts '-'

puts '1. Загальний список замовлень:'
puts "   Список: #{all_orders.inspect}"
puts "   Кількість: #{total_orders_count}"

puts "\n2. Клієнти, що сьогодні відвідали кафе:"
puts "   Список: #{visited_clients.inspect}"
puts "   Кількість: #{visited_clients_count}"

puts "\n3. Кількість «безалкогольних» замовлень = #{ba_orders_count}"

puts "\n4. Клієнти, що робили «безалкогольні» замовлення (без повторень):"
puts "   Список: #{ba_unique_clients.inspect}"
puts "   Кількість: #{ba_unique_count}"

puts "\n5. Кількість «алкогольних» замовлень = #{al_orders_count}"

puts "\n6. Клієнти, що робили «алкогольні» замовлення (без повторень):"
puts "   Список: #{al_unique_clients.inspect}"
puts "   Кількість: #{al_unique_count}"

puts "\n7. Клієнти, що робили обидва типи замовлень:"
puts "   Список: #{both_types_clients.inspect}"
puts "   Кількість: #{both_types_count}"

puts "\n8. Постійні клієнти, що сьогодні НЕ відвідували кафе:"
puts "   Список: #{not_visited_clients.inspect}"
puts "   Кількість: #{not_visited_count}"
puts '-'