function transpose(a::Array)
    dims = size(a)
    rows = dims[1]
    cols = dims[2]
    reshape([a[i, j] for i in 1:rows for j in 1:cols], cols, rows)
end

function internalize(board)
    d = length(board)
    if d == 1
        vs = [string(c) for c in split(board[1], "")]
        vs = reshape(vs, 1, length(vs))
    elseif all([length(e) == 1 for e in board])
        vs = reshape(board, d, 1)
    else
        values = [string(c) for row in board for c in split(row, "")]
        vs = reshape(values, d, d)
        vs = transpose(vs)
    end
    return vs
end

function minecoords(board)
    mines = []
    dims = size(board)
    [(i, j) for i in 1:dims[1], j in 1:dims[2] if board[i, j] == "*"]
end

function neighbours(mine)
    x = mine[1]
    y = mine[2]
    ns = Set(Iterators.product((x-1, x, x+1), (y-1, y, y+1)) |> collect)
    setdiff(ns, Set([mine]))
end

function allneighbours(board)
    d = size(board)
    [neighbours((i, j)) for i in 1:d[1], j in 1:d[2]]
end

function minecount(board, mines)
    d = size(board)
    nearbymines = [intersect(mines, candidates) for candidates in allneighbours(board)]
    reshape([length(nm) for nm in nearbymines], d[1], d[2])
end

function countstrings(counts, mines)
    stringcounts = string.(counts)
    for mine in mines
        stringcounts[mine[1], mine[2]] = "*"
    end
    for i in eachindex(stringcounts)
        if stringcounts[i] == "0"
            stringcounts[i] = " "
        end
    end
    dims = size(stringcounts)
    rows = dims[1]
    cols = dims[2]
    [*(stringcounts[i, 1:cols]...) for i in 1:rows]
end

function annotate(inboard)
    if inboard == []
        return []
    end
    if inboard == [""]
        return [""]
    end
    mergedboard = reduce(*, inboard, init="")
    if mergedboard == mergedboard[1]^length(mergedboard)
        return inboard
    end
    board = internalize(inboard)
    mines = minecoords(board)
    counts = minecount(board, mines)
    countstrings(counts, mines)
end
