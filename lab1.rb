
def calculate_book_metrics(pages, circulation)
  author_fee = 24.0 * pages
  design_cost = author_fee * 0.30
  typesetting_cost = 1.2 * pages
  total_editorial = author_fee + design_cost + typesetting_cost

  editorial_per_copy = total_editorial / circulation

  paper_cost = (0.16 * pages) + 3.0
  ink_cost = 0.04 * pages
  depreciation_cost = 0.08 * pages
  printing_per_copy = paper_cost + ink_cost + depreciation_cost

  unit_cost = editorial_per_copy + printing_per_copy

  unit_profit = unit_cost * 0.23
  total_profit = unit_profit * circulation

  publisher_cost = unit_cost + unit_profit
  unit_tax = publisher_cost * 0.30

  total_unit_price = publisher_cost + unit_tax

  {
    author_fee: author_fee,
    unit_cost: unit_cost,
    total_profit: total_profit,
    unit_tax: unit_tax,
    total_unit_price: total_unit_price
  }
end

puts 'Lab №1: Лінійні обчислення'

print 'Введіть кількість сторінок у книзі: '
pages = gets.chomp.to_i

print 'Введіть тираж (кількість екземплярів): '
circulation = gets.chomp.to_i

if pages <= 0 || circulation <= 0
  puts "\nПомилка: кількість сторінок та тираж мають бути більшими за 0!"
  exit
end

results = calculate_book_metrics(pages, circulation)

puts "\nРезультати розрахунку:"
puts '-'
printf("1. Авторський гонорар (на весь тираж):  %10.2f грн\n", results[:author_fee])
printf("2. Собівартість однієї книги:            %10.2f грн\n", results[:unit_cost])
printf("3. Прибуток видавництва від тиражу:      %10.2f грн\n", results[:total_profit])
printf("4. Податок на один екземпляр:            %10.2f грн\n", results[:unit_tax])
printf("5. Загальна вартість одного екземпляра:  %10.2f грн\n", results[:total_unit_price])
puts '-'