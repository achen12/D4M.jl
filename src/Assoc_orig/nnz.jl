
import Base.nnz
function nnz(A::Assoc)
    #nnz: Returns numbers of non-zeros 

    return nnz(A.A)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

