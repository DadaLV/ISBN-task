def calculate_isbn13_check_digit(isbn)
  isbn_str = isbn.to_s
  sum = 0

  isbn_str.each_char.with_index do |digit, index|
    weight = index.even? ? 1 : 3
    sum += digit.to_i * weight
  end

  check_digit = (10 - (sum % 10))
  check_digit = 0 if check_digit == 10

  puts "The complete ISBN is: #{isbn_str + check_digit.to_s}"
end

calculate_isbn13_check_digit(978014300723)
calculate_isbn13_check_digit(978212345680)
calculate_isbn13_check_digit(978316148410)

