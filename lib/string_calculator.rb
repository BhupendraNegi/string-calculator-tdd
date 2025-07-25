class StringCalculator
    def self.add(numbers)
      return if numbers.nil?

      return 0 if numbers.strip.empty?

      delimiter = [",", "\n"]

      numbers.split(Regexp.union(delimiter)).map(&:to_i).sum
    end
end