function bins(coll, item, left, right)
    if left > right
        return left:right
    end
    mid_index = ceil(Int, (left + right) / 2)
    coll_item = coll[mid_index]
    if coll_item == item
        return mid_index:mid_index
    elseif coll_item > item
        bins(coll, item, left, mid_index - 1)
    else
        bins(coll, item, mid_index + 1, right)
    end
end

function binarysearch(coll, item)
    bins(coll, item, 1, length(coll))
end
