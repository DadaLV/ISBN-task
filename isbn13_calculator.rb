class Isbn13Calculator
  WEIGHT_EVEN = 1
  WEIGHT_ODD = 3

  def self.calculate_check_digit(isbn)
    isbn_str = normalize_isbn(isbn)
    raise ArgumentError, "Invalid ISBN-13 format: #{isbn}. It should be 12." unless valid_isbn_format?(isbn_str)
    sum = 0
    isbn_str.each_char.with_index do |digit, index|
      weight = index.even? ? WEIGHT_EVEN : WEIGHT_ODD
      sum += digit.to_i * weight
    end

    check_digit = (10 - (sum % 10))
    check_digit = 0 if check_digit == 10

    isbn_str + check_digit.to_s
  end

  private

  def self.normalize_isbn(isbn)
    isbn.to_s.gsub(/[-\s]/, '')
  end

  def self.valid_isbn_format?(isbn)
    isbn.match(/^\d{12}$/)
  end
end

