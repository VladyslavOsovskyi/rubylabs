# array
cpp_code = [
  "#include <stdio.h>",
  "#include <stdlib.h>",
  "#define MAX_SIZE 100",
  "#ifdef DEBUG",
  "    printf(\"Debug mode active\\n\");",
  "#endif",
  "int main() {",
  "    // решітка в рядку, не буде чіплятись (#)",
  "    char symbol = '#';",
  "    #pragma once",
  "    return 0;",
  "}"
]
PREPROCESSOR_REGEX = /^\s*#\s*([a-zA-Z_]\w*)/

# process of arrays function
def transform_preprocessor_directives(lines)
  lines.map do |line|
    line.gsub(PREPROCESSOR_REGEX) do |_match|
      "_#{$1.upcase}"
    end
  end
end

puts "5.1: Регулярні вирази (var 2) ==="
puts "\n--- Вхідний фрагмент C/C++ коду: ---"
puts cpp_code.join("\n")

# change
transformed_code = transform_preprocessor_directives(cpp_code)

puts "\n" + ("=")
puts "--- Результуючий код після заміни через Regexp: ---"
puts transformed_code.join("\n")
puts "="