function encode(s)
    if s == ""
        return ""
    end

    encoding = ""
    prev_char = ""
    count = 1

    for char in s
        if char != prev_char
            if prev_char != ""
                if count == 1
                    encoding *= prev_char
                else
                    encoding *= string(count) * prev_char
                end
            end
            count = 1
            prev_char = char
        else
            count += 1
        end
    end
    # Final character handling
    if count == 1
        encoding *= prev_char
    else
        encoding *= string(count) * prev_char
    end
    return encoding
end

function decode(s)
    decode = ""
    count = ""
    for char in s
        if isdigit(char)
            count *= char
        else
            if count == ""
                decode *= char
            else
                decode *= char ^ parse(Int, count)
            end
            count = ""
        end
    end
    return decode
end
