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
  end
end
