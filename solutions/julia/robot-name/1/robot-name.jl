using Random

mutable struct Robot
    name::String
    function Robot()
        name = randomuniquename()
        new(name)
    end
end

robotnames = Set{String}()

function randomname()
	  letters = randstring('A':'Z', 2)
	  numbers = randstring('0':'9', 3)
    letters * numbers
end

function randomuniquename()
    name = randomname()
    while name in robotnames
	      name = randomname()
    end
    push!(robotnames, name)
    name
end

function reset!(instance::Robot)
    newname = randomuniquename()
    instance.name = newname
end

function name(instance::Robot)
    instance.name
end
