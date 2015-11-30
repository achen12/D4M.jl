
#=
Protected Accessor Function for User.
=#
function Adj(A::Assoc)
    return copy(A.A)
end

function Col(A::Assoc)
    if isa(A.col[1], AbstractString)
        return copy(A.col)
    end
    return 1:size(A.A,2)
end



function Row(A::Assoc)
    if isa(A.row[1], AbstractString)
        return copy(A.row)
    end
    return 1:size(A.A,1)
end

function Val(A::Assoc)
    if isa(A.col[1], AbstractString)
        return copy(A.val)
    end
    return sort(unique(nonzeros(A.A)))
end
