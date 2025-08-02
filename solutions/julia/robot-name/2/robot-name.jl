using Random

mutable struct Robot
    name::String
    function Robot()
        new(randomuniquename())
    end
end

function robotnamespace()
    letters = 'A':'Z'
    strings = vec(join.(Iterators.product(letters, letters)))
    _digits = '0':'9'
    numbers = vec(join.(Iterators.product(_digits, _digits, _digits)))
    Set(vec(join.(Iterators.product(strings, numbers))))
end

availablenames = robotnamespace()

function randomuniquename()
    name = rand(availablenames)
    setdiff!(availablenames, [name])
    return name
end

function reset!(instance::Robot)
    instance.name = randomuniquename()
end

function name(instance::Robot)
    instance.name
end
