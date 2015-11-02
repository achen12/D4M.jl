import Base.transpose

function transpose(A::Assoc)
    return Assoc(A.col,A.row,A.val,A.A')
end
