import Base.&

function Base.&(A::Assoc, B::Assoc)
#First, create the row and col of the sum
ABrow = sort!(unique(vcat(A.row,B.row)))
ABcol = sort!(unique(vcat(A.col,B.col)))
#Filling the sparse matrix with 

ABA = spzeros(size(ABrow,1), size(ABcol,1))
rowMapping = [findfirst(ABrow, x) for x in A.row]
colMapping = [findfirst(ABcol, x) for x in A.col]
ABA[rowMapping,colMapping] = spones(A.A)

rowMapping = [findfirst(ABrow, x) for x in B.row]
colMapping = [findfirst(ABcol, x) for x in B.col]
ABA[rowMapping,colMapping] += spones(B.A)

ABA = spones(ABA) #Perhaps leave 2s as is?  Showing strictly union?

return Assoc(ABrow,ABcol,promote([""],A.val)[1],ABA) 
end
