dictionary = ["hi","ruby","how","are","you","by","ho","yo"]
user_input = "Ruby? ruby rose? hw are you ruby hihyo"

def lowercase(user_input)
    return user_input.downcase
end



def sub_string(user_input,dictionary)
    input = lowercase(user_input).split(" ")
    hash = {}
    dictionary.each do |word|
        i = 0
        input.each do |input_word|
            if input_word.include?(word)
                i += 1
            end
        end
        p word + " = " + i.to_s
        hash[word] = i
    end
    p hash
end

sub_string(user_input,dictionary)