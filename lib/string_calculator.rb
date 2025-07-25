class StringCalculator
    def self.add(numbers)
      return nil if numbers.nil?

      return 0 if numbers.strip.empty?

      numbers.split(/,|\n/).map(&:to_i).sum
    end
end