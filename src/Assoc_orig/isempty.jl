import Base.isempty

#=
isempty : check if given Assoc is empty.

Note: Associ can be considered empty even if there are mapping for potential or past values.
=#
function isempty(A::Assoc)
    return isempty(A.A)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

