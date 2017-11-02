def caesar string, shift
    uppercase_chars = ("A".bytes[0].."Z".bytes[0]).to_a
    lowercase_chars = ("a".bytes[0].."z".bytes[0]).to_a
    encrypted_string = ""
    char_array = nil
    string.each_byte do |ascii_code|
        if (uppercase_chars.include? ascii_code) || (lowercase_chars.include? ascii_code)
            char_array = ((uppercase_chars.include? ascii_code) ? uppercase_chars : lowercase_chars)
            if (ascii_code + shift) > char_array.last
                index_ = char_array.index(ascii_code) 
                char_array = char_array[index_..-1] + char_array[0...index_]
                puts char_array.inspect
                encrypted_string += (char_array[shift]).chr
            else
                encrypted_string += (ascii_code + shift).chr
            end
        else
            encrypted_string += ascii_code.chr
        end       
    end
    encrypted_string
end

puts caesar("This a string!", 10)

[65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90]
[97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122]
