import Base.*

function *(A::Assoc,B::Assoc)
    #Check A,B, if string => Logical
    At = A
    Bt = B
    if(!isa(A.val[1], Number ))
        At = logical(A)
    end
    if(!isa(B.val[1],Number))
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


    AB = Assoc(ABrow,ABcol,promote([1.0,A.val])[1],ABA)

    return condense(AB)
end
