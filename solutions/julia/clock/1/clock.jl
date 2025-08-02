import Base.+
import Base.-
import Dates

function clock(hours, minutes)
    h, m = divrem(minutes, 60)
    if m < 0
        h -= 1
    end
    h = (((hours + h) % 24) + 24) % 24
    m = ((m % 60) + 60) % 60
    return h, m
end

struct Clock
    hours::Int8
    minutes::Int8
    Clock(hours, minutes) = new(clock(hours, minutes)...)
end

+(c::Clock, d::Dates.Minute) = Clock(clock(c.hours, c.minutes + Dates.value(d))...)

-(c::Clock, d::Dates.Minute) = Clock(clock(c.hours, c.minutes - Dates.value(d))...)

show(io::IO, c::Clock) = print(io, "\"$(lpad(c.hours, 2, '0')):$(lpad(c.minutes, 2, '0'))\"")
