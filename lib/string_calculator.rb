class StringCalculator
    def self.add(numbers)
      return if numbers.nil?

      return 0 if numbers.strip.empty?

      delimiters = [",", "\n"]

      if numbers.start_with?("//")
        parts = numbers.split("\n", 2) # Split in two parts
        custom_delimiter = parts[0][2]
        numbers = parts[1]
        delimiters = [custom_delimiter]
      end

      numbers.split(Regexp.union(delimiters)).map(&:to_i).sum
    end
end