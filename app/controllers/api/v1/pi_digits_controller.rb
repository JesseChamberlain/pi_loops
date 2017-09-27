class Api::V1::PiDigitsController < ApplicationController

  def index
    loops = search_for_loops
    render json: {loops: loops}
  end

  def search_for_loops
    t = 10
    pi_length = 99980
    initial_index = 2
    initial_int = Pi_digit.find(2)
    def search_single_loop(i, int, len, all, single)
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
        digits_at_id.each do | digit |
          id = int.id
          if single[0] == nil
            single.push({start: id})
          else
            single.last.each do | key, value |
              if value == nil
                # load properly, but need to load a different num
                single.last[key] = digit
                binding.pry
              end
            end
          end
          if digit < 2
            #hits a 0 should back up and ?
            #hits a 1 should break and move to a 1x
            binding.pry
            single.last.each do | key, value |
              single.last[key] = nil
              int = Pi_digit.find(key)
            end
          else
            id_hash = {}
            id_hash[id] = digit
            single.push(id_hash)
            if single.length > 1
              if single[0]["start"] == digit
                all.push(single)
                single = []
                i += 1
                int = Pi_digit.find(int.id+1)
                break
              else
                int = Pi_digit.find(digit)
              end
            else
              int = Pi_digit.find(digit)
              search_single_loop(i, int, len, all, single)
            end
            search_single_loop(i, int, len, all, single)
          end
        end
        i += 1
      end
      return all
    end
    found_loops = search_single_loop(initial_index, initial_int, pi_length, [], [])
    return t
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
end
