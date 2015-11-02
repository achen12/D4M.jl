import Base.sum
function sum(A::Assoc, dim::Int64)
    if(dim == 1)
        return Assoc(promote([""],A.row)[1],A.col, promote([""],A.val)[1],sparse(sum(A.A,1)))
    elseif (dim == 2)
    
        return Assoc(A.row,promote([""],A.col)[1], promote([""],A.val)[1],sparse(sum(A.A,2)))
    end

end
