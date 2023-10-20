require 'rspec'
require_relative '../isbn13_validator'

describe Isbn13Validator do
  describe '.validate_check_digit' do
    it 'returns true for a valid ISBN-13 with correct check digit' do
      expect(Isbn13Validator.validate_check_digit('9780143007234')).to be(true)
      expect(Isbn13Validator.validate_check_digit('9783836214063')).to be(true)
    end

    it 'returns false for a valid ISBN-13 with incorrect check digit' do
      expect(Isbn13Validator.validate_check_digit('9780143007235')).to be(false)
      expect(Isbn13Validator.validate_check_digit('9783836214061')).to be(false)
    end

    it 'raises an error for invalid ISBN-13 format' do
      expect { Isbn13Validator.validate_check_digit('321321321321') }.to raise_error(ArgumentError)
      expect { Isbn13Validator.validate_check_digit('978014300723222') }.to raise_error(ArgumentError)
      expect { Isbn13Validator.validate_check_digit('jhgjhgjhgjhg') }.to raise_error(ArgumentError)
    end
  end
end
