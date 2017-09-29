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
    initial_int = Pi_digit.find(10)
    digit_at_id_index = 0
    zero_found = 0
    def search_single_loop(i, digit_i, z, int, len, all, single)
      break_out = false
      while i < len && break_out == false
        digits_at_id = [
          # int["digit"],
          int["two_digits"],
          int["three_digits"],
          int["four_digits"],
          int["five_digits"]
        ]
        while digit_i < 5
          if int.digit == 0 && single == []
            int = Pi_digit.find(int.id+1)
            search_single_loop(i, digit_i, z, int, len, all, single)
          end
          # Chances are this will need to incorporate a complex digit counter for
          # the digit count in each single index. This stops it for now.
          if single.length == 60
            if single[0]["start"] == 100
              binding.pry
            end
            int = Pi_digit.find(single[0]["start"]+1)
            single = []
            search_single_loop(i, digit_i, z, int, len, all, single)
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
                    found_loop = []
                    single.each do | pair |
                      pair.each do | key, value |
                        found_loop.push(key)
                      end
                    end
                    found_loop.push("Length: #{found_loop.count-1}")
                    all.push(found_loop)
                    single = []
                    int = Pi_digit.find(digit+1)
                    break
                  else
                    int = Pi_digit.find(digit)
                  end
                else
                  # it never gets here?
                  binding.pry
                  int = Pi_digit.find(digit)
                  search_single_loop(i, digit_i, z, int, len, all, single)
                end
              else
                digit_i += 1
              end
            end
            search_single_loop(i, digit_i, z, int, len, all, single)
          else
            if single == []
              int = Pi_digit.find(id+1)
            else
              single.last.each do | key, value |
                z = (value.digits.count)
                single.last[key] = nil
                int = Pi_digit.find(key)
              end
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
