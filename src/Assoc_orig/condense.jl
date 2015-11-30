
#=
Condense : remove empty row and column within the input Assoc A and return the new condensed Assoc
=#
function condense(A::Assoc)#performance improvement needed
    nonZeroCol = findnz(sum(A.A,1))[2]
    nonZeroRow = findnz(sum(A.A,2))[1]
    Newrow = A.row[nonZeroRow]
    Newcol = A.col[nonZeroCol]
    NewA = A.A[nonZeroRow,nonZeroCol]


    return Assoc(Newrow,Newcol,A.val,NewA)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

