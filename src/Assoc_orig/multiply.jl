import Base.*

#=

* : matrix multiply between two Assoc.

If there are Strings in Assoc Value mapping, the Assoc will be reduced to logical.

=#
function *(A::Assoc,B::Assoc)
    #Check A,B, if string => Logical
    At = A
    Bt = B
    if(!isa(A.val[1],Number))
        At = logical(A)
    end
    if(!isa(B.val[1],Number))
        Bt = logical(B)
    end
    ## A*B operation
    #Improve intersect with unique sorted sets
    ABintersect = sortedintersect(At.col,Bt.row)
    
    if (size(ABintersect,1) == 0)
        return Assoc([1],[1],0,(+))
    end
    
    AintMap = searchsortedmapping(ABintersect,At.col) 
    BintMap = searchsortedmapping(ABintersect,Bt.row) 

    ABA = At.A[:,AintMap]*Bt.A[BintMap,:]

    AB = Assoc(At.row,Bt.col,Array{Union{AbstractString,Number}}([1.0]),ABA)

    return condense(AB)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

