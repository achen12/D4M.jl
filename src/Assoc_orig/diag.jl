import Base.diag
#=
diag : Output the diagonal of input Assoc A.
Outputs the Assoc with only the diagonal elements of A.
=#
function diag(A::Assoc)
    return deepCondense(Assoc(A.row,A.col,A.val,sparse(diagm(diag(A.A)))))
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

