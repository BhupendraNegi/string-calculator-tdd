require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns 0 for an empty string' do
        expect(StringCalculator.add(" ")).to eq(0)
    end

    it 'returns nil for nil' do
        expect(StringCalculator.add(nil)).to eq(nil)
    end

    it 'returns the number for string number' do
        expect(StringCalculator.add("1")).to eq(1)
        expect(StringCalculator.add("2")).to eq(2)
    end

    it 'returns the number for string number with spaces' do
        expect(StringCalculator.add("1 ")).to eq(1)
        expect(StringCalculator.add("    2")).to eq(2)
        expect(StringCalculator.add("    3   ")).to eq(3)
    end
  end
end
