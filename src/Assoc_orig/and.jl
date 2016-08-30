import Base.&

#=
&,And : Logical & of A and B
=#
function Base.&(A::Assoc, B::Assoc)
#First, create the row and col of the intersection
ABrow = intersect(A.row,B.row)
ABcol = intersect(A.col,B.col)
#Filling the sparse matrix with 

AA = spzeros(size(ABrow,1), size(ABcol,1))
rowMapping = searchsortedmapping(ABrow,A.row)
colMapping = searchsortedmapping(ABcol,A.col)
AA = spones(A.A[rowMapping,colMapping])
AA = round(Int64,AA)

BB = spzeros(size(ABrow,1), size(ABcol,1))
rowMapping = searchsortedmapping(ABrow,B.row)
colMapping = searchsortedmapping(ABcol,B.col)
BB = spones(B.A[rowMapping,colMapping])
BB = round(Int64,BB)

ABA = AA & BB 
ABA = ABA * 1.0
#TODO Doesn't seems to handle union of two non Numeric case...  Perhaps an isolated ressole?
return Assoc(ABrow,ABcol,AssocEleArray,ABA) 
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

