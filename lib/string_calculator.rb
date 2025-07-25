class StringCalculator
    def self.add(numbers)
      return nil if numbers.nil?

      return 0 if numbers.strip.empty?

      if numbers.include?(',')
        numbers.split(',').map(&:to_i).sum
      else
        numbers.to_i
      end

    end
end