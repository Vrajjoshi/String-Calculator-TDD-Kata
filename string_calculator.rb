class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?  

    delimiter = /,|\n/ 
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      delimiter = Regexp.escape(delimiter)
    end

    num_list = numbers.split(/#{delimiter}/).map(&:to_i)  
    negatives = num_list.select(&:negative?)

    raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?

    num_list.sum
  end
end
