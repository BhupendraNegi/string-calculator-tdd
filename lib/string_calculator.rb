class StringCalculator
    def self.add(numbers)
      return nil if numbers.nil?

      return 0 if numbers.strip.empty?

      return numbers.to_i

    end
end