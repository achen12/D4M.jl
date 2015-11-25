import Base.+
+(A::Assoc,B::Assoc) = plus(A::Assoc,B::Assoc)
function plus(A::Assoc,B::Assoc)
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
    ABrow = intersect(A.row,B.row)
    ABcol = intersect(A.col,B.col)
    if (size(ABrow,1) == 0 || size(ABcol,1) == 0)
        return Assoc([1],[1],0,(+))
    end

    ABA =  spzero(length(ABrow),length(ABcol))
    Arow = [searchsortedfirst(ABrow,x) for x in A.row]
    Acol = [searchsortedfirst(ABcol,x) for x in A.col]
    Brow = [searchsortedfirst(ABrow,x) for x in B.row]
    Bcol = [searchsortedfirst(ABcol,x) for x in B.col]
    ABA[Arow,Acol] = A.A
    ABA[Brow,Bcol] += B.A
    AB = Assoc(ABrow,ABcol, promote([1.0],A.val)[1], ABA) 
    ##Condense
    
    return condense(AB) 
end
