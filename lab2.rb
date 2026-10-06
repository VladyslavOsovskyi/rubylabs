
def calculate_apartment_price(area, material, floor, district, style, category)
  mat_index = case material.downcase
              when 'бетон', 'панель'
                300
              when 'цегла'
                500
              when 'композит'
                800
              else
                raise ArgumentError, "Невідомий матеріал: #{material}"
              end

  cost_price = area * mat_index

  floor_coef = if (3..7).cover?(floor)
                 1.4
               elsif floor >= 1
                 1.1
               else
                 raise ArgumentError, 'Поверх має бути >= 1'
               end

  district_coef = if district.downcase == 'центр'
                    1.7
                  elsif district.downcase == 'спальний'
                    1.4
                  elsif district.downcase == 'приміський'
                    1.15
                  else
                    raise ArgumentError, "Невідомий район: #{district}"
                  end

  location_price = cost_price * floor_coef * district_coef

  style_coef = case style.downcase
               when 'хайтех' then 2.0
               when 'ексклюзів' then 1.7
               when 'індивідуал' then 1.5
               when 'стандарт' then 1.05
               else
                 raise ArgumentError, "Невідомий стиль: #{style}"
               end

  builder_price = location_price * style_coef

  cat_index = category.downcase == 'елітна' ? 1.75 :
              (category.downcase == 'бюджетна' ? 1.5 :
              (category.downcase == 'пільгова' ? 1.07 : nil))

  raise ArgumentError, "Невідома категорія: #{category}" if cat_index.nil?

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

print 'Введіть матеріал (бетон / цегла / композит): '
material = gets.chomp.strip

print 'Введіть поверх: '
floor = gets.chomp.to_i

print 'Введіть район (центр / спальний / приміський): '
district = gets.chomp.strip

print 'Введіть стиль (хайтех / ексклюзів / індивідуал / стандарт): '
style = gets.chomp.strip

print 'Введіть категорію (елітна / бюджетна / пільгова): '
category = gets.chomp.strip

begin
  res = calculate_apartment_price(area, material, floor, district, style, category)

  puts "\n" + ('=' * 50)
  puts 'РЕЗУЛЬТАТИ ОБЧИСЛЕНЬ:'
  puts '-'
  printf("Собівартість (СВ):           %12.2f грн\n", res[:cost_price])
  printf("Вартість забудовника (ПК):   %12.2f грн\n", res[:builder_price])
  printf("Загальна вартість (ПВ):      %12.2f грн\n", res[:total_price])
  puts '-'
rescue ArgumentError => e
  puts "\nПомилка введення даних: #{e.message}"
end