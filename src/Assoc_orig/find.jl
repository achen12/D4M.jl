import Base.find
#=
find : get the triplet of the input Assoc in three array.  Similar to findnz for sparse.
=#
function find(A::Assoc)
    row, col, val = findnz(A.A)
    n = nnz(A.A)
    #map if the Associative array isn't numerical
    if isa(A.row[1],AbstractString)
        row = [ A.row[row[i]] for i in 1:n]
    end

    if isa(A.col[1],AbstractString)
        col = [ A.col[col[i]] for i in 1:n]
    end
    
    if isa(A.val[1],AbstractString)
        val = [ A.val[val[i]] for i in 1:n]
    end

    return row, col, val
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

