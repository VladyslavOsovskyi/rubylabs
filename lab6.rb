def count_goods(items)
  items.each_with_object(Hash.new(0)) do |item, result|
    name, count = item.split('-').map(&:strip)
    
    result[name.to_sym] += count.to_i
  end
end

# test
input_data = ['Milk-10', 'Milk-20', 'Sugar-10']
p count_goods(input_data)


def categorize_students(csv_str, max_score, upper_bound, lower_bound)
  top_threshold = max_score * (100 - upper_bound) / 100.0
  mid_threshold = max_score * (lower_bound / 100.0) 

  students = csv_str.split(/\\|\n/).map(&:strip).reject(&:empty?).map do |row|
    name, score = row.split(',').map(&:strip)
    [name, score.to_f]
  end

  sorted_students = students.sort_by { |name, score| [-score, name] }

  result = { top: [], middle: [], bottom: [] }

  sorted_students.each do |name, score|
    if score >= top_threshold
      result[:top] << name
    elsif score >= mid_threshold
      result[:middle] << name
    else
      result[:bottom] << name
    end
  end

  result
end

# test
csv_data = "Student1,70\\ Student3,80\\ Student2,80"
max = 100
upper = 10
lower = 15

p categorize_students(csv_data, max, upper, lower)