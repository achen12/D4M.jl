import Base.&

function Base.&(A::Assoc, B::Assoc)
#First, create the row and col of the intersection
ABrow = intersect(A.row,B.row)
ABcol = intersect(A.col,B.col)
#Filling the sparse matrix with 

AA = spzeros(size(ABrow,1), size(ABcol,1))
rowMapping = [findfirst(A.row, x) for x in ABrow]
colMapping = [findfirst(A.col, x) for x in ABcol]
AA = spones(A.A[rowMapping,colMapping])
AA = round(Int64,AA)

BB = spzeros(size(ABrow,1), size(ABcol,1))
rowMapping = [findfirst(B.row, x) for x in ABrow]
colMapping = [findfirst(B.col, x) for x in ABcol]
BB = spones(B.A[rowMapping,colMapping])
BB = round(Int64,BB)

ABA = AA & BB 
ABA = ABA * 1.0

return Assoc(ABrow,ABcol,promote([1.0],A.val)[1],ABA) 
end
