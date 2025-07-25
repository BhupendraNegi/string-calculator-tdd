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

    it 'returns the sum of two comma separated numbers' do
        expect(StringCalculator.add("1,2")).not_to eq(1)
        expect(StringCalculator.add("1,2")).to eq(3)
        expect(StringCalculator.add("1,3")).to eq(4)
    end

    it 'returns the sum of two comma separated numbers with spaces' do
        expect(StringCalculator.add("1,2 ")).to eq(3)
        expect(StringCalculator.add(" 1,2")).to eq(3)
        expect(StringCalculator.add(" 1 , 2")).to eq(3)
    end

    it 'returns the sum of multiple comma separated numbers' do
        expect(StringCalculator.add("1,2, 3 ")).to eq(6)
        expect(StringCalculator.add(" 1,2, 5")).to eq(8)
        expect(StringCalculator.add(" 1 , 2, 9, 0, 6")).to eq(18)
    end

    it 'returns the sum with newlines also as delimiters' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
        expect(StringCalculator.add("1\n2\n3")).to eq(6)
        expect(StringCalculator.add("1\n2\n\n3")).to eq(6)
    end

    it 'supports custom delimiters' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//;\n1.2")).to eq(1)
    end

    it 'raises an exception when negative numbers are included' do
        expect {
          StringCalculator.add("1,-2")
        }.to raise_error("negative numbers not allowed: -2")

        expect {
            StringCalculator.add("1,-2,-5,3")
        }.to raise_error("negative numbers not allowed: -2, -5")
    end

    it 'should ignore numbers greater than 1000' do
        expect(StringCalculator.add("2,1001")).to eq(2)
        expect(StringCalculator.add("1234,5,10000")).to eq(5)
        expect(StringCalculator.add("1234,5,9,10000")).to eq(14)
    end

    it 'supports delimiters of any length using format “//[delimiter]\n”' do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
        expect(StringCalculator.add("//[....]\n1.... 2 .... 3")).to eq(6)
    end

    it 'supports multiple custom delimiters of any length' do
        expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
        expect(StringCalculator.add("//[--][@@]\n4--5@@6")).to eq(15)
        expect(StringCalculator.add("//[!!!][###][::]\n1!!!2###3:: 4")).to eq(10)
    end

  end
end
