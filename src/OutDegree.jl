#=
OutDegree : Calculate the out-degree of matrix A
=#

function OutDegree(A)
    dout = sum(A,2)
    dout_i,dout_j,dout_v = findnz(dout)
    ndout = sum(sparse(dout_i,dout_v,1),1)
    return ndout
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

