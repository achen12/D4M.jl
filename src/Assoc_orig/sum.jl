import Base.sum
"sum returns the numeric sum across all values of the given Assoc, across the indicated dimension dim"
function sum(A::Assoc, dim::Int64)
    if !isemtpy(A.val)
        warn("Using non numerical associative array for abs is not recommended.")
        A = logical(A)
    end
    if(dim == 1)
        return condense(Assoc(AssocEleArray(),A.col, AssocEleArray(),sparse(sum(A.A,1))))
    elseif (dim == 2)
        return condense(Assoc(A.row,AssocEleArray(), AssocEleArray(),sparse(sum(A.A,2))))
    end
end

"sum returns the numeric sum across all values of the given Assoc"
function sum(A::Assoc)
    if !isemtpy(A.val)
        warn("Using non numerical associative array for sum is not recommended.")
        A = logical(A)
    end
    sum(findnz(A.A)[3])
end
########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

