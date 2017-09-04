# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#70 digits of pi for initial seed testing.
require_relative "pi"

pi = Pi.new
pi_digits_array = pi.pi_digits.split(%r{\s*})

pi_digits_array.each_with_index do |d, i|

  # Adjust to address end of string problems
  if i <= (pi_digits_array.length - 11)
    pi_digit = Pi_digit.new
    digit = d.to_i

    # Conditional to account for '0' issue
    if digit == 0
      pi_digit.assign_attributes(
        digit: digit,
        two_digits: digit,
        three_digits: digit,
        four_digits: digit,
        five_digits: digit,
        six_digits: digit,
        seven_digits: digit,
        eight_digits: digit,
        nine_digits: digit,
        ten_digits: digit
      )
    else
      # Helper to calulate columns in each digit row
      def column_creator(current_digit, next_digit)
        (current_digit * 10) + next_digit.to_i
      end

      two_digits = column_creator(digit, pi_digits_array[i + 1])
      three_digits = column_creator(two_digits, pi_digits_array[i + 2])
      four_digits = column_creator(three_digits, pi_digits_array[i + 3])
      five_digits = column_creator(four_digits, pi_digits_array[i + 4])
      six_digits = column_creator(five_digits, pi_digits_array[i + 5])
      seven_digits = column_creator(six_digits, pi_digits_array[i + 6])
      eight_digits = column_creator(seven_digits, pi_digits_array[i + 7])
      nine_digits = column_creator(eight_digits, pi_digits_array[i + 8])
      ten_digits = column_creator(nine_digits, pi_digits_array[i + 9])

      pi_digit.assign_attributes(
        digit: digit,
        two_digits: two_digits,
        three_digits: three_digits,
        four_digits: four_digits,
        five_digits: five_digits,
        six_digits: six_digits,
        seven_digits: seven_digits,
        eight_digits: eight_digits,
        nine_digits: nine_digits,
        ten_digits: ten_digits
      )
    end

    pi_digit.save!
  end
end
