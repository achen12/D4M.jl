import Base.*

#=

* : matrix multiply between two Assoc.

If there are Strings in Assoc Value mapping, the Assoc will be reduced to logical.

=#
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
    ABrow = At.row
    ABcol = Bt.col
    #@time ABintersect = intersect(A.col,B.row)

    #Improve intersect with unique sorted sets
    ABintersect = []
    temp_index_A = 1
    temp_index_B = 1
    while (temp_index_A <= length(A.col)) & (temp_index_B <= length(B.row))
        if A.col[temp_index_A] == B.row[temp_index_B]
            push!(ABintersect,A.col[temp_index_A])
            temp_index_A += 1
            temp_index_B += 1
        elseif A.col[temp_index_A] < B.row[temp_index_B]
            temp_index_A += 1
        else
            temp_index_B += 1
        end
    end
    
    if (size(ABintersect,1) == 0)
        return Assoc([1],[1],0,(+))
    end
    AintMap = [searchsortedfirst(At.col,x) for x in ABintersect]
    BintMap = [searchsortedfirst(Bt.row,x) for x in ABintersect] 

    ABA = At.A[:,AintMap]*Bt.A[BintMap,:]


    AB = Assoc(ABrow,ABcol,Array{Union{AbstractString,Number}}([1.0]),ABA)

    return condense(AB)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

