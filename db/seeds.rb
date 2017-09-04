# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#70 digits of pi for initial seed testing.
PI_DIGITS = "14 159 265358979 3238462643383 27950288 419716939937 510582097 4944592 307816406286"

pi_digits_array = PI_DIGITS.split(%r{\s*})

pi_digits_array.each_with_index do |d, i|
  # Adjust to address end of string problems
  unless i == (pi_digits_array.length - 11)
    pi_digit = Pi_digit.new
    digit = d.to_i
    
    # account for 0 issue
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
      two_digits = (digit * 10) + pi_digits_array[i+1].to_i
      three_digits = (two_digits * 10) + pi_digits_array[i+2].to_i
      four_digits = (three_digits * 10) + pi_digits_array[i+3].to_i
      five_digits = (four_digits * 10) + pi_digits_array[i+4].to_i
      six_digits = (five_digits * 10) + pi_digits_array[i+5].to_i
      seven_digits = (six_digits * 10) + pi_digits_array[i+6].to_i
      eight_digits = (seven_digits * 10) + pi_digits_array[i+7].to_i
      nine_digits = (eight_digits * 10) + pi_digits_array[i+8].to_i
      ten_digits = (nine_digits * 10) + pi_digits_array[i+9].to_i

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
