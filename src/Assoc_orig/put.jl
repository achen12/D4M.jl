putAdj(A::Assoc,AA::AbstractSparseMatrix) =  Assoc(copy(A.row),copy(A.col),copy(A.val),AA)
putAdj(A::Assoc,AA::Array{Int,2}) =  putAdj(A::Assoc,sparse(AA))

putRow(A::Assoc,ARow::Array{Union{AbstractString,Number},1}) =  Assoc(ARow,copy(A.col),copy(A.val),copy(A.A))

putCol(A::Assoc,ACol::Array{Union{AbstractString,Number},1}) =  Assoc(copy(A.row),ACol,copy(A.val),copy(A.A))

putVal(A::Assoc,AVal::Array{Union{AbstractString,Number},1}) =  Assoc(copy(A.row),copy(A.col),AVal,copy(A.A))



