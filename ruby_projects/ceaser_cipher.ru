# takes a string input from user
p 'Enter a sentence'
string = gets.chomp
# takes an integer input from user
p 'Enter a shift value between 0-25'
shiftValue = gets.chomp.to_i

def ceaser_cipher(string, shiftValue)
  string_array = string.split('') # splits string to an arry of characters

  string_array.map! do |char|
    char_ascii_val = char.ord
    case char_ascii_val
    when (65..90) # if char.ord is within range than they are shifted
      char_shift_val = char_ascii_val + shiftValue
      if char_shift_val > 90 # loops values from z to a if shift value is less than 26
        char_shift_val = char_ascii_val - (26 - shiftValue)
      end
      char_shift_val.chr
    when (97..122)
      char_shift_val = char_ascii_val + shiftValue
      char_shift_val = char_ascii_val - (26 - shiftValue) if char_shift_val > 122
      char_shift_val.chr
    else
      char_ascii_val.chr # leaves space and punctuations as they were
    end
  end
  p string_array.join('')
end

ceaser_cipher(string, shiftValue)
