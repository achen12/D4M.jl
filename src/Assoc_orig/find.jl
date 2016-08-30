import Base.find
#=
find : get the triplet of the input Assoc in three array.  Similar to findnz for sparse.
=#
function find(A::Assoc)
    row, col, val = findnz(A.A)
    n = nnz(A.A)
    #map if the Associative array isn't numerical
    if !isempty(A.row)
        row = [ A.row[i] for i in row]
    end

    if !isempty(A.col)
        col = [ A.col[i] for i in col]
    end
    
    if !isempty(A.val)
        val = [ A.val[i] for i in val]
    end

    return row, col, val
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

