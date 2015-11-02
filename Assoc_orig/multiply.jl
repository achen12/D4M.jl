import Base.*

function *(A::Assoc,B::Assoc)
    #Check A,B, if string => Logical
    At = A
    Bt = B
    if(!isequal(A.val, [""]))
        At = logical(A)
    end
    if(!isequal(B.val,[""]))
        Bt = logical(B)
    end
    ## A*B operation
    ABrow = A.row
    ABcol = B.col
    ABintersect = intersect(A.col,B.row)
    if (size(ABintersect,1) == 0)
        return Assoc([1],[1],0,(+))
    end
    AintMap = [findfirst(A.col,x) for x in ABintersect]
    BintMap = [findfirst(B.row,x) for x in ABintersect] 

    ABA = A.A[:,AintMap]*B.A[BintMap,:]

    ##Condense
    nonZeroCol = find(x->x!=0,[sum(ABA,1)[1,i] for i in 1:size(ABcol,1)])
    nonZeroRow = find(x->x!=0,[sum(ABA,2)[i,1] for i in 1:size(ABrow,1)])

    ABrow = ABrow[nonZeroRow]
    ABcol = ABcol[nonZeroCol]
    ABA = ABA[nonZeroRow,nonZeroCol]

    return Assoc(ABrow,ABcol,promote([""],A.val)[1],ABA)
end
