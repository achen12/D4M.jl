#=
Reduce all value to logical, checking if that cell is empty
=#

logical(A::Assoc) = Assoc(A.row,A.col,AssocEleArray(),spones(A.A))


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

