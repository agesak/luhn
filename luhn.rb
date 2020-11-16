=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn

  def self.valid?(num)
    # validations
    num = num.gsub(/\s+/, "")
    return false if num.length <= 1
    return false if /[^0-9]+/.match(num)

    array = num.split("").reverse.map{|s| s.to_i}
    array.each_with_index do |num, index|
      if index.odd?
        val = num * 2
        if val > 9
          val -= 9
        end
        array[index] = val
      end
    end

    return true if array.sum % 10 == 0
    return false
  end

end