
n = 12

ba = [3, 6, 11, 5, 6, 7, 6, 5]
al = [10, 6, 9, 5, 6, 9, 5]

all_registered_clients = (1..n).to_a


all_orders = ba + al
total_orders_count = all_orders.size

visited_clients = (ba | al).sort
visited_clients_count = visited_clients.size

ba_orders_count = ba.size

ba_unique_clients = ba.uniq.sort
ba_unique_count = ba_unique_clients.size

al_orders_count = al.size

al_unique_clients = al.uniq.sort
al_unique_count = al_unique_clients.size

both_types_clients = (ba & al).sort
both_types_count = both_types_clients.size

not_visited_clients = (all_registered_clients - visited_clients).sort
not_visited_count = not_visited_clients.size

puts 'Lab №3: Масиви. Первинна обробка'
puts "Загальна кількість постійних клієнтів (N): #{n}"
puts "Безалкогольні замовлення (ba): #{ba.inspect}"
puts "Алкогольні замовлення (al):    #{al.inspect}"
puts '-' * 60

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
puts '=' * 60