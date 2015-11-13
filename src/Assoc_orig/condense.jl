function condense(A::Assoc)
    nonZeroCol = find(x->x!=0,[sum(A.A,1)[1,i] for i in 1:size(A.col,1)])
    nonZeroRow = find(x->x!=0,[sum(A.A,2)[i,1] for i in 1:size(A.row,1)])
    Newrow = A.row[nonZeroRow]
    Newcol = A.col[nonZeroCol]
    NewA = A.A[nonZeroRow,nonZeroCol]


    return Assoc(Newrow,Newcol,A.val,NewA)
end
