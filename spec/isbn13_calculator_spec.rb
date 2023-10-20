require 'rspec'
require_relative '../isbn13_calculator'

describe Isbn13Calculator do
  describe '.calculate_check_digit' do    
    it 'handles ISBN with hyphens and spaces' do
      expect(Isbn13Calculator.calculate_check_digit('97-8014 300 723')).to eq('9780143007234')
    end
    
    it 'raises an error for invalid ISBN format' do
      expect { Isbn13Calculator.calculate_check_digit(1234567890123) }.to raise_error(ArgumentError)
      expect { Isbn13Calculator.calculate_check_digit('1234567890123') }.to raise_error(ArgumentError)
      expect { Isbn13Calculator.calculate_check_digit('1khkjjhk0123') }.to raise_error(ArgumentError)
    end

    it 'calculates the ISBN-13 check digit correctly' do
      expect(Isbn13Calculator.calculate_check_digit(978014300723)).to eq('9780143007234')
    end
  end
end
