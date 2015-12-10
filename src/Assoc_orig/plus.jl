import Base.+

#=
 +,plus : matrix add for Assoc.

 If Assoc has String in value mapping, the Assoc will be logical instead.
=#

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
    ABrow = sortedunion(At.row,Bt.row)
    ABcol = sortedunion(At.col,Bt.col)
    if (size(ABrow,1) == 0 || size(ABcol,1) == 0)
        return Assoc([1],[1],0,(+))
    end

    ABA =  spzeros(length(ABrow),length(ABcol))
    Arow = searchsortedmapping(At.row,ABrow)
    Acol = searchsortedmapping(At.col,ABcol)
    Brow = searchsortedmapping(Bt.row,ABrow)
    Bcol = searchsortedmapping(Bt.col,ABcol)
    ABA[Arow,Acol] += At.A
    ABA[Brow,Bcol] += Bt.A
    AB = Assoc(ABrow,ABcol, Array{Union{AbstractString,Number}}([1.0]), ABA) 
    
    return condense(AB) #Incase of negation
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

