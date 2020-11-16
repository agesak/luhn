class Luhn

  # Time: O(n)?
  # Space: O(n)?
  def self.valid?(num)
    # validations
    num = num.gsub(/\s+/, "")
    return false if num.length <= 1
    return false if /[^0-9]+/.match(num)

    array = num.split("").reverse.map{|s| s.to_i}           # Time: O(n)? Space: O(n)
    array.each_with_index do |num, index|                   # Time: O(n)
      if index.odd?
        val = num * 2
        if val > 9
          val -= 9
        end
        array[index] = val                                   # Time: O(1)?
      end
    end

    return true if array.sum % 10 == 0
    return false
  end

end
