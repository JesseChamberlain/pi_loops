class Api::V1::PiDigitsController < ApplicationController

  def index
    loops = search_for_loops
    render json: {loops: loops}
  end

  def search_for_loops
    test = 10
    all_loops = []
    pi_length = 99980
    index = 1
    while index < pi_length
      pi_digit = Pi_digit.find(index+1)
      digits_at_id = [
        pi_digit["digit"],
        pi_digit["two_digits"],
        pi_digit["three_digits"],
        pi_digit["four_digits"],
        pi_digit["five_digits"],
        pi_digit["six_digits"],
        pi_digit["seven_digits"],
        pi_digit["eight_digits"],
        pi_digit["nine_digits"]
      ]
      digits_at_id.each do | digit |
        single_loop = {}
        single_loop[pi_digit.id] = digit
        int = digit
        break_out = false
        while int < pi_length && break_out == false
          next_digit = Pi_digit.find(int).digit
          single_loop[int] = next_digit
          if next_digit < 2
            break_out = true
          elsif next_digit == single_loop[1]
            all_loops.push(single_loop)
            break_out = true
          end
          int = next_digit
        end
      end
      index += 1
    end
    return test
  end
end
