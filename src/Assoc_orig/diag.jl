import Base.diag

function diag(A::Assoc)
    return condense(Assoc(A.row,A.col,A.val,sparse(diagm(diag(A.A)))))
end
