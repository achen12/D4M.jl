import Base.(<)
#=
== : get a new Assoc where all of the elements of input Assoc mataches the given Element.
=#
function <(A::Assoc, E::Union{AbstractString,Number})
    tarIndex = searchsortedfirst(A.val,E)
    rowkey, colkey, valkey = findnz(A.A)
    mapping = find( x-> x < tarIndex, valkey)
    rowkey , colkey = unique(rowkey[mapping]), unique(colkey[mapping])
    sort!(rowkey)
    sort!(colkey)
    return A[rowkey,colkey]
end

<(E::Union{AbstractString,Number},A::Assoc) = (A > E)

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

