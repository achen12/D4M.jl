#=
nocol : remove columns mapping
=#

function nocol(A::Assoc)
    return condense(Assoc(A.row,promote(ones(size(A.col)),A.col)[1],A.val,A.A))
end

#=
norow : remove rows mapping
=#

function norow(A::Assoc)
    return condense(Assoc(promote(ones(size(A.row)),A.row)[1],A.col,A.val,A.A))
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

