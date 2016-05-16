import Base.+

#=
 +,plus : matrix add for Assoc.

 If Assoc has String in value mapping, the Assoc will be logical instead.
=#

+(A::Assoc,B::Assoc) = plus(A::Assoc,B::Assoc)
function plus(A::Assoc,B::Assoc)
    ABrow = sortedunion(A.row,B.row)
    ABcol = sortedunion(A.col,B.col)
    if (size(ABrow,1) == 0 || size(ABcol,1) == 0) #Empty short circuit
        return Assoc([1],[1],0,(+))
    end

    At = A;
    Bt = B;

    #For numeric Case 
    if(isa(Val(A)[1],Number) || isa(Val(A)[1],Number))
        if(A.val != [1.0])
            At = logical(A);
        end
        if(B.val != [1.0])
            Bt = logical(B);
        end
        ## A+B operation
    
        ABA =  spzeros(length(ABrow),length(ABcol))
        Arow = searchsortedmapping(At.row,ABrow)
        Acol = searchsortedmapping(At.col,ABcol)
        Brow = searchsortedmapping(Bt.row,ABrow)
        Bcol = searchsortedmapping(Bt.col,ABcol)
        ABA[Arow,Acol] += At.A
        ABA[Brow,Bcol] += Bt.A
        AB = Assoc(ABrow,ABcol, Array{Union{AbstractString,Number}}([1.0]), ABA) 
        
        return condense(AB) #Incase of negation
    else
        #For the case where both Assoc Array has String Values.
        #Def of Union of String = max(A,B)
        ValA = Val(At)
        ValB = Val(Bt)
        ABval = sortedunion(ValA,ValB)
        Aval = searchsortedmapping(ValA,ABval);
        Bval = searchsortedmapping(ValB,ABval);
        

        #Map Values
        
        #End Map Values
        
        ABA =  spzeros(length(ABrow),length(ABcol))
        Arow = searchsortedmapping(At.row,ABrow)
        Acol = searchsortedmapping(At.col,ABcol)
        Brow = searchsortedmapping(Bt.row,ABrow)
        Bcol = searchsortedmapping(Bt.col,ABcol)
        At.A.nzval = map(x-> Aval[x],At.A.nzval)
        Bt.A.nzval = map(x-> Bval[x],Bt.A.nzval)
        ABA[Arow,Acol] += At.A
        ABA[Brow,Bcol] =  max(Bt.A , ABA[Brow,Bcol])
        AB = Assoc(ABrow,ABcol, ABval, ABA) 
        return condense(AB)
    end
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

