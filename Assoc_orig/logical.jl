logical(A::Assoc) = Assoc(A.row,A.col,promote([""],A.val)[1],spones(A.A))
