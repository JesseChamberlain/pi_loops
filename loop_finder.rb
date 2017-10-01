# Run this script:  rails runner loop_finder.rb

# Method to search for loops (might need to wrap this in a method too?)
def search_single_loop(i, digit_i, z, int, len, all, single)

  # This loop changes the pi index
  while i < len
    digits_at_id = [
      int["digit"],
      int["two_digits"],
      int["three_digits"],
      int["four_digits"],
      int["five_digits"]
    ]

    # Move to next index of digits_at_id
    while digit_i < 5
      id = int.id
      id_hash = {}

      # if the digit is 0 and the loop is empty change pi index
      if int.digit == 0 && single == []

        # Call recursive loop
        int = Pi_digit.find(int.id+1)
        search_single_loop(i, digit_i, z, int, len, all, single)  # Call recursive loop
      end  # if int.digit == 0...

      # Chances are this will need to incorporate a complex digit counter for
      # the digit count in each single index. This halts it for now.
      # if single[0]["start"] % 20 == 0
      if single != [] && single[0]["start"] > 103
        binding.pry
      end  # if single != []...

      # Set maximum loop length
      if single.length == 600
        puts "Num: #{single[0]["start"]}, No Loop"
        int = Pi_digit.find(single[0]["start"]+1)
        single = []
        search_single_loop(i, digit_i, z, int, len, all, single)  # Call recursive loop
      end  # if single.length == 180

      # Conditional if previous num is zero
      if 0 < z
        digit = digits_at_id[z]
      else
        digit = digits_at_id[digit_i]
      end  # if 0 < z

      # Conditional if digit == 0
      if digit != 0
        z = 0

        # Initialize start if single loop is empty (find a better spot for this?)
        if single[0] == nil
          single.push({"start" => id})
        else

          # Check against loops values for an internal loop match
          value_match = false
          single.each do | h |
            if h.has_value?(digit) == true && single[0]["start"] != digit
              value_match = true
            end  # if h.has_value?(digit)...
          end  # single.each

          # If there is no match add to the single loop array
          if value_match == false

            # Determines where to add to the single loop array
            single.last.each do | key, value |
              if value == nil
                single.last[key] = digit
              else
                id_hash[id] = digit
                single.push(id_hash)
                digit_i = 0
              end  # if value == nil
            end  # single.last.each

            # (is this needed?) Makes sure there are more than 1 numbers.
            if single.length > 1

              # Checks against first digit to recognize loop
              if single[0]["start"] == digit

                # Creates an array of just the numbers in the found loop
                found_loop = []
                single.each do | pair |
                  pair.each do | key, value |
                    found_loop.push(key)
                  end  # pair.each
                end  # single.each

                # Adds the found loop to the all array, resets int, breaks while loop.
                puts "Num: #{digit}, Loop Length: #{found_loop.count-1}"
                all.push("Num: #{digit}, Loop Length: #{found_loop.count-1}")
                # found_loop.push("Length: #{found_loop.count-1}")
                # all.push(found_loop)
                single = []
                int = Pi_digit.find(digit+1)
                break
              else
                int = Pi_digit.find(digit)
              end  # if single[0]["start"] == digit
            else
              # it never gets here?
              binding.pry
              int = Pi_digit.find(digit)
              search_single_loop(i, digit_i, z, int, len, all, single)  # Call recursive loop
            end  # if single.length > 1
          else
            digit_i += 1
          end  # if value_match == false
        end  # if single[0] == nil
        search_single_loop(i, digit_i, z, int, len, all, single)  # Call recursive loop
      else

        # This might be repeating code above?
        if single == []
          int = Pi_digit.find(id+1)
        else
          single.last.each do | key, value |
            z = (value.digits.count)
            single.last[key] = nil
            int = Pi_digit.find(key)
          end  # single.last.each
        end  # single == []
      end  # if digit != 0
      search_single_loop(i, digit_i, z, int, len, all, single)  # Call recursive loop
    end  # while digit_i < 5

    i += 1
  end  # while i < len

  return all
end  # search_single_loop

# Initial variables and method call
pi_length = 99980
initial_index = 2
initial_int = Pi_digit.find(103) # known loops at index=1, index=19 & index=40
digit_at_id_index = 0
zero_found = 0
found_loops = search_single_loop(initial_index, digit_at_id_index, zero_found, initial_int, pi_length, [], [])
