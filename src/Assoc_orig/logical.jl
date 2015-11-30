#=
Reduce all value to logical, checking if that cell is empty
=#

logical(A::Assoc) = Assoc(A.row,A.col,promote([1.0],A.val)[1],spones(A.A))


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

