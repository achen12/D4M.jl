import Base.sum
function sum(A::Assoc, dim::Int64)
    if(dim == 1)
        return condense(Assoc(promote([1.0],A.row)[1],A.col, promote([1.0],A.val)[1],sparse(sum(A.A,1))))
    elseif (dim == 2)
    
        return condense(Assoc(A.row,promote([1.0],A.col)[1], promote([1.0],A.val)[1],sparse(sum(A.A,2))))
    end
end


sum(A::Assoc) = sum(findnz(A.A)[3])
