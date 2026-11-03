require 'date'

class Author
  attr_reader :surname, :name, :patronymic

  @@authors = []

  def self.authors
    @@authors
  end

  def initialize(surname, name, patronymic = nil)
    if valid_part?(surname, required: true) &&
       valid_part?(name, required: true) &&
       valid_part?(patronymic, required: false)

      @surname = surname
      @name = name
      @patronymic = patronymic

      @@authors << self unless @@authors.include?(self)
    else
      @surname = nil
      @name = nil
      @patronymic = nil
    end
  end

  def ==(other)
    other.is_a?(Author) &&
      @surname == other.surname &&
      @name == other.name &&
      @patronymic == other.patronymic
  end
  alias eql? ==

  def hash
    [@surname, @name, @patronymic].hash
  end

  def valid?
    !@surname.nil? && !@name.nil?
  end

  private

  def valid_part?(str, required:)
    return !required if str.nil? || str == ""
    return false unless str.is_a?(String)
    str.length <= 15 && str.match?(/\A[\p{L}\-]+\z/)
  end
end

class Book
  attr_reader :authors, :title, :publisher, :year

  def initialize(authors, title, publisher, year)
    if valid_authors?(authors) &&
       valid_text?(title) &&
       valid_text?(publisher) &&
       valid_year?(year)

      @authors = authors
      @title = title
      @publisher = publisher
      @year = year.to_i
    else
      @authors = nil
      @title = nil
      @publisher = nil
      @year = nil
    end
  end

  private

  def valid_authors?(authors)
    return false unless authors.is_a?(Array) && !authors.empty?
    authors.all? { |a| a.is_a?(Author) && a.valid? } && authors.uniq.size == authors.size
  end

  def valid_text?(str)
    return false unless str.is_a?(String) && !str.empty?
    str.match?(/\A[\p{L}\d\s\-.,;]+\z/)
  end

  def valid_year?(year)
    year_str = year.to_s
    return false unless year_str.match?(/\A\d{4}\z/)
    year_str.to_i <= Date.today.year
  end
end

# --- Перевірка Task 4 ---
a1 = Author.new("Франко", "Іван", "Якович")
a2 = Author.new("Франко", "Іван", "Якович") # duplicate
a3 = Author.new("Косач-Квітка", "Лариса")
a_bad = Author.new("Іван123", "Тест") 
puts "Унікальних авторів у базі: #{Author.authors.size}" 
book1 = Book.new([a1, a3], "Збірник творів, том 1.", "Наукова думка", 2020)
p [book1.title, book1.year] 

book_bad = Book.new([a1, a2], "Книга", "Видавництво", 2020)
p [book_bad.authors, book_bad.title, book_bad.year] 