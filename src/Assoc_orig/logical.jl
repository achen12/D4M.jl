logical(A::Assoc) = Assoc(A.row,A.col,promote([1.0],A.val)[1],spones(A.A))
