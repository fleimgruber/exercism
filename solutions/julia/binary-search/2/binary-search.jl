function bins(coll, item, left, right)
    left > right && return left:right
    mid_index = ceil(Int, (left + right) / 2)
    coll_item = coll[mid_index]
    coll_item == item && return mid_index:mid_index
    if coll_item > item
        bins(coll, item, left, mid_index - 1)
    else
        bins(coll, item, mid_index + 1, right)
    end
end

binarysearch(coll, item) = bins(coll, item, 1, length(coll))
