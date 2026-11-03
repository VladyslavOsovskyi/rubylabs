def sum
  yield(4) + yield(0) + yield(-12)
end

resul1t = sum do |x|
  x < 0 ? x**2 : x
end

result = resul1t

puts resul1t 
# 148