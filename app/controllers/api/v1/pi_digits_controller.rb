class Api::V1::PiDigitsController < ApplicationController

  def index
    loops = search_for_loops
    render json: {loops: loops}
  end

  def search_for_loops
    t = 10
    pi_length = 99980
    initial_index = 2
    # known loops at index=19 & index=40
    initial_int = Pi_digit.find(2)
    digit_at_id_index = 0
    zero_found = 0
    def search_single_loop(i, digit_i, z, int, len, all, single)
      break_out = false
      while i < len && break_out == false
        digits_at_id = [
          int["digit"],
          int["two_digits"],
          int["three_digits"],
          int["four_digits"],
          int["five_digits"],
          int["six_digits"],
          int["seven_digits"],
          int["eight_digits"],
          int["nine_digits"]
        ]
        while digit_i < 9
          # Chances are this will need to incorporate a complex digit counter for
          # the digit count in each single index.
          if single.length == 22
            if single[0]["start"] > 40
              binding.pry
            end
            int = Pi_digit.find(single[0]["start"]+1)
            single = []
          end
          if 0 < z
            digit = digits_at_id[z]
          else
            digit = digits_at_id[digit_i]
          end
          id = int.id
          id_hash = {}
          if digit != 0
            z = 0
            if single[0] == nil
              single.push({"start" => id})
            else
              value_match = false
              single.each do | h |
                if h.has_value?(digit) == true && single[0]["start"] != digit
                  value_match = true
                end
              end
              if value_match == false
                single.last.each do | key, value |
                  if value == nil
                    # load properly, but need to load a different num
                    single.last[key] = digit
                  else
                    id_hash[id] = digit
                    single.push(id_hash)
                    digit_i = 0
                  end
                end
                if single.length > 1
                  #need to check has_key for digit?
                  if single[0]["start"] == digit
                    all.push(single)
                    single = []
                    int = Pi_digit.find(digit+1)
                    break
                  else
                    int = Pi_digit.find(digit)
                  end
                else
                  int = Pi_digit.find(digit)
                  search_single_loop(i, digit_i, int, len, all, single)
                end
              else
                digit_i += 1
              end
            end
            search_single_loop(i, digit_i, z, int, len, all, single)
          else
            single.last.each do | key, value |
              z = (value.digits.count)
              single.last[key] = nil
              int = Pi_digit.find(key)
            end
          end
          search_single_loop(i, digit_i, z, int, len, all, single)
        end
        i += 1
      end
      return all
    end
    found_loops = search_single_loop(initial_index, digit_at_id_index, zero_found, initial_int, pi_length, [], [])
    return t
  end
end


#
# def search_for_loops
#   test = 10
#   all_loops = []
#   pi_length = 99980
#   index = 1
#   while index < pi_length
#     pi_digit = Pi_digit.find(index+1)
#     digits_at_id = [
#       pi_digit["digit"],
#       pi_digit["two_digits"],
#       pi_digit["three_digits"],
#       pi_digit["four_digits"],
#       pi_digit["five_digits"],
#       pi_digit["six_digits"],
#       pi_digit["seven_digits"],
#       pi_digit["eight_digits"],
#       pi_digit["nine_digits"]
#     ]
#     digits_at_id.each do | digit |
#       single_loop = {}
#       single_loop[pi_digit.id] = digit
#       int = digit
#       break_out = false
#
#       # this could probably be used recursively, calling while above?
#       while int < pi_length && break_out == false
#         next_digit = Pi_digit.find(int).digit
#         single_loop[int] = next_digit
#         if next_digit < 2
#           break_out = true
#         elsif next_digit == single_loop[1]
#           all_loops.push(single_loop)
#           break_out = true
#         end
#         int = next_digit
#       end
#     end
#     index += 1
#   end
#   return test
# end
