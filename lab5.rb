
puts 'Lab №5: Обробка текстових даних'

print 'Введіть текстовий рядок: '
input_text = gets.chomp

if input_text.strip.empty?
  puts 'Рядок порожній!'
  exit
end

text_length = input_text.length

uppercase_count = input_text.count('A-Z')
lowercase_count = input_text.count('a-z')
digits_count    = input_text.count('0-9')

words = input_text.split

sorted_by_length_asc = words.sort_by(&:length)

capitalized_words = words.map(&:capitalize)

abbreviation_candidates = words.select do |word|
  word.match?(/[a-zA-Z]/) && word.match?(/\d/)
end

sorted_by_length_desc = words.sort_by(&:length).reverse
new_text = sorted_by_length_desc.join(' ')

puts "\n" + ('=' * 65)
puts 'РЕЗУЛЬТАТИ ОБРОБКИ РЯДКА:'
puts '-' * 65

puts "1. Введений текст: \"#{input_text}\""
puts "2. Розмір всього рядка (з пробілами): #{text_length} симв."

puts "\n3. Статистика суцільного рядка:"
puts "   - Заголовні (великі) букви [A-Z]: #{uppercase_count}"
puts "   - Прописні (малі) букви [a-z]:    #{lowercase_count}"
puts "   - Цифри [0-9]:                    #{digits_count}"

puts "\n4. Масив слів:"
puts "   #{words.inspect}"

puts "\n5. Слова, впорядковані за зростанням довжини:"
puts "   #{sorted_by_length_asc.inspect}"

puts "\n6. Слова у заголовному форматі (Title Case):"
puts "   #{capitalized_words.inspect}"

puts "\n7. Слова, підозрілі на абревіатуру (містять букви та цифри):"
if abbreviation_candidates.empty?
  puts '   Не виявлено'
else
  puts "   #{abbreviation_candidates.inspect}"
end

puts "\n8. Новий текст (слова у порядку спадання довжини):"
puts "   \"#{new_text}\""
puts '=' * 65