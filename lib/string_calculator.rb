class StringCalculator
    def self.add(numbers_string)
      return if numbers_string.nil?

      return 0 if numbers_string.strip.empty?

      delimiters = [",", "\n"]

      if numbers_string.start_with?("//")
        parts = numbers_string.split("\n", 2) # Split in two parts
        custom_delimiter = parts[0][2]
        numbers_string = parts[1]
        delimiters = [custom_delimiter]
      end

      numbers = numbers_string.split(Regexp.union(delimiters)).map(&:to_i)
      
      negatives = numbers.select { |n| n < 0 }
      raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

      numbers.sum
    end
end