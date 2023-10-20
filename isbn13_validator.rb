class Isbn13Validator
  WEIGHT_EVEN = 1
  WEIGHT_ODD = 3

  def self.validate_check_digit(isbn)
    isbn_str = normalize_isbn(isbn)
    raise ArgumentError, "Invalid ISBN-13 format: #{isbn}. It should be 13 digits." unless valid_isbn_format?(isbn_str)

    input_check_digit = isbn_str[-1].to_i

    sum = 0
    isbn_str[0, 12].each_char.with_index do |digit, index|
      weight = index.even? ? WEIGHT_EVEN : WEIGHT_ODD
      sum += digit.to_i * weight
    end
    expected_check_digit = (10 - (sum % 10))
    expected_check_digit = 0 if expected_check_digit == 10

    input_check_digit == expected_check_digit
  end

  private

  def self.normalize_isbn(isbn)
    isbn.to_s.gsub(/[-\s]/, '')
  end

  def self.valid_isbn_format?(isbn)
    isbn.match(/^\d{13}$/)
  end
end

