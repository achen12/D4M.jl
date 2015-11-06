import Base.(==)

function ==(A::Assoc, E::Union{AbstractString,Number})
    tarIndex = searchsortedfirst(A.val,E)
    rowkey, colkey, valkey = findnz(A.A)
    mapping = find( x-> x == tarIndex, valkey)
    rowkey , colkey = unique(rowkey[mapping]), unique(colkey[mapping])
    sort!(rowkey)
    sort!(colkey)
    return A[rowkey,colkey]
end

==(E::Union{AbstractString,Number},A::Assoc) = (A == E)
