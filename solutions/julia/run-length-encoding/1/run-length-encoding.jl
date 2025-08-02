function encode(s)
    if s == ""
        return ""
    end
    encoded = ""
    seen = ""
    seen_count = 0
    for (fst, snd) in zip(s, string(s[2:end], "."))
        if seen == fst
            seen_count += 1
        else
            seen = fst
            seen_count = 1
        end
        if fst != snd
            if seen_count == 1
                encoded = string(encoded, seen)
            else
                encoded = string(encoded, seen_count, seen)
            end
        end
    end
    return encoded
end

function decode(s)
    if s == ""
        return ""
    end
    decoded = ""
    count = "0"
    for (fst, snd) in zip(s, string(s[2:end], "."))
        if snd == "."
            decoded = string(decoded, fst)
        elseif isdigit(fst)
            count = string(count, fst)
        elseif ~isdigit(fst)
            if count == "0"
                count = "1"
            end
            decoded = string(decoded, repeat(fst, parse(Int, count)))
            count = "0"
        end
    end
    return decoded
end
