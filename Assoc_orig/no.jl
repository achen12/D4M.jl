function nocol(A::Assoc)
    return Assoc(A.row,promote(ones(size(A.col)),A.col)[1],A.val,A.A)
end

function norow(A::Assoc)
    return Assoc(promote(ones(size(A.row)),A.row)[1],A.col,A.val,A.A)
end

