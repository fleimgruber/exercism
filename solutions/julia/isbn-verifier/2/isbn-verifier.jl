macro isbn_str(s)
    ISBN(s)
end

struct ISBN <: AbstractString
    s::AbstractString

    ISBN(s) = verify(s) ? new(replace(s, "-" => "")) : throw(DomainError(s, "invalid ISBN string"))
end

string(s::ISBN) = s.s

escape(isbn::String) = replace(isbn, 'X' => 'a') |> (x -> replace(x, '-' => ""))

isbntonumbers(isbn::String) = [parse(Int, c, base=16) for c in escape(isbn)]

checksum(numbers::Array{Int}) = sum(numbers .* collect(10:-1:1)) % 11 == 0

Base.:(==)(a::ISBN, b::ISBN) = escape(a.s) == escape(b.s)

function verify(isbn::String)
    length(escape(isbn)) == 10 || return false
    occursin(r"(?:\d-?){9}[\dX]", isbn) && checksum(isbntonumbers(isbn))
end

Base.isvalid(::Type{ISBN}, s::AbstractString) = verify(s)
