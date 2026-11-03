class Mark
  attr_reader :subject, :value

  def initialize(subject, value)
    @subject = subject
    @value = value
  end

  def to_s
    "#{@subject} : #{@value}"
  end
end

class Student
  attr_reader :marks, :name

  def initialize(name)
    @name = name
    @marks = []
  end

  def exists?(subject_title)
    @marks.any? { |mark| mark.subject == subject_title }
  end

  def add_mark(mark)
    @marks << mark unless exists?(mark.subject)
  end

  alias_method :add, :add_mark

  def to_s
    marks_str = @marks.map(&:to_s).join(', ')
    "#{@name}, marks: [#{marks_str}]"
  end
end

# task 2
class RetakeStudent < Student
  def add_mark(mark)
    index = @marks.find_index { |m| m.subject == mark.subject }
    if index
      @marks[index] = mark
    else
      @marks << mark
    end
  end
  alias_method :add, :add_mark
end

mark = Mark.new('C++', 5)
puts mark # 5

st = Student.new('First student')
st.add_mark(mark)
puts st # 5

mark2 = Mark.new('C++', 3)
st.add(mark2)
puts st # 5

ret = RetakeStudent.new('Other student')
ret.add_mark(mark)
ret.add(mark2)
puts ret # 3