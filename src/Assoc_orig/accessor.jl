
#=
Accessor Function for User.
=#
function Adj(A::Assoc)
    return copy(A.A)
end

function Col(A::Assoc)
    if !isempty(A.col)
        return copy(A.col)
    end
    return AssocEleArray(collect(1:size(A.A,2)))
end

function Row(A::Assoc)
    if !isempty(A.row)
        return copy(A.row)
    end
    return AssocEleArray(collect(1:size(A.A,1)))
end

function Val(A::Assoc)
    if !isempty(A.val)
        return copy(A.val)
    end
    return sort(unique(nonzeros(A.A)))
end
