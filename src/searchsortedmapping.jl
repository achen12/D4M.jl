function searchsortedmapping(A::Array, B::Array)
    ## Assume A \in B
    AtoB = Array{Int64,1}()
    temp_index_A = 1
    temp_index_B = 1

    while (temp_index_A <= length(A)) 
        if A[temp_index_A] == B[temp_index_B]
            push!(AtoB,temp_index_B)
            temp_index_A += 1
            temp_index_B += 1
        else
            temp_index_B += 1
        end
    end

    return AtoB
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

