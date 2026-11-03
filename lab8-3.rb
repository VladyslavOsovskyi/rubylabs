class Pizza
  attr_reader :d, :ingredients, :number

  @@count = 0
  @@fail_count = 0

  def initialize(d, ingredients = [])
    if [25, 50].include?(d)
      @@count += 1
      @number = @@count
      @d = d
      @ingredients = ingredients
    else
      @@fail_count += 1
      @number = 0
      @d = 0
      @ingredients = []
    end
  end

  def self.failInstance
    @@fail_count
  end
end

# test
pizza1 = Pizza.new(10, ['mushroom', 'cheese'])
pizza2 = Pizza.new(25, ['mushroom', 'cheese', 'cherry'])
pizza3 = Pizza.new(50, ['mushroom'])
pizza4 = Pizza.new(100, ['mushroom', 'cheese', 'cherry'])

puts Pizza.failInstance # => 2
p [pizza1.number, pizza1.d, pizza1.ingredients]
p [pizza2.number, pizza2.d, pizza2.ingredients]
p [pizza3.number, pizza3.d, pizza3.ingredients]