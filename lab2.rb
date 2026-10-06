$stdout.sync = true

def calculate_apartment_price(area, material_choice, floor, district_choice, style_choice, category_choice)

  mat_index = case material_choice
              when 1 then 300 # бетон / панель
              when 2 then 500 # цегла
              when 3 then 800 # композит
              else
                raise ArgumentError, "Некоректний вибір матеріалу (оберіть 1, 2 або 3)"
              end

  cost_price = area * mat_index

  floor_coef = if (3..7).cover?(floor)
                 1.4
               elsif floor >= 1
                 1.1
               else
                 raise ArgumentError, "Поверх має бути >= 1"
               end

  district_coef = if district_choice == 1
                    1.7  # центр
                  elsif district_choice == 2
                    1.4  # спальний
                  elsif district_choice == 3
                    1.15 # приміський
                  else
                    raise ArgumentError, "Некоректний вибір району (оберіть 1, 2 або 3)"
                  end

  location_price = cost_price * floor_coef * district_coef

  style_coef = case style_choice
               when 1 then 2.0  # хайтех
               when 2 then 1.7  # ексклюзів
               when 3 then 1.5  # індивідуал
               when 4 then 1.05 # стандарт
               else
                 raise ArgumentError, "Некоректний вибір стилю (оберіть 1, 2, 3 або 4)"
               end

  builder_price = location_price * style_coef

  cat_index = category_choice == 1 ? 1.75 :
              (category_choice == 2 ? 1.5 :
              (category_choice == 3 ? 1.07 : nil))

  raise ArgumentError, "Некоректний вибір категорії (оберіть 1, 2 або 3)" if cat_index.nil?

  total_price = builder_price * cat_index

  {
    cost_price: cost_price,
    builder_price: builder_price,
    total_price: total_price
  }
end

puts 'Lab №2: Розгалуження'

print 'Введіть площу (м²): '
area = gets.chomp.to_f

puts "\nОберіть матеріал:"
puts '  1 - Бетон / Панель'
puts '  2 - Цегла'
puts '  3 - Композитні матеріали'
print 'Ваш вибір (1-3): '
material_choice = gets.chomp.to_i

print "\nВведіть поверх: "
floor = gets.chomp.to_i

puts "\nОберіть район:"
puts '  1 - Центр'
puts '  2 - Спальний'
puts '  3 - Приміський'
print 'Ваш вибір (1-3): '
district_choice = gets.chomp.to_i

puts "\nОберіть стиль:"
puts '  1 - Хайтех'
puts '  2 - Ексклюзів'
puts '  3 - Індивідуал'
puts '  4 - Стандарт'
print 'Ваш вибір (1-4): '
style_choice = gets.chomp.to_i

puts "\nОберіть категорію:"
puts '  1 - Елітна'
puts '  2 - Бюджетна'
puts '  3 - Пільгова'
print 'Ваш вибір (1-3): '
category_choice = gets.chomp.to_i

begin
  res = calculate_apartment_price(area, material_choice, floor, district_choice, style_choice, category_choice)

  puts "\n" + ('=')
  puts 'РЕЗУЛЬТАТИ ОБЧИСЛЕНЬ:'
  puts '-'
  printf("Собівартість (СВ):           %12.2f грн\n", res[:cost_price])
  printf("Вартість забудовника (ПК):   %12.2f грн\n", res[:builder_price])
  printf("Загальна вартість (ПВ):      %12.2f грн\n", res[:total_price])
  puts '-'
rescue ArgumentError => e
  puts "\nПомилка введення даних: #{e.message}"
end