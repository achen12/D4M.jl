function sortedunion(A::Array, B::Array)
    ABintersect = typeof(A)()
    temp_index_A = 1
    temp_index_B = 1

    while (temp_index_A <= length(A)) || (temp_index_B <= length(B))
        if (temp_index_A > length(A))
            push!(ABintersect,B[temp_index_B])
            temp_index_B += 1
        elseif (temp_index_B > length(B))
            push!(ABintersect,A[temp_index_A])
            temp_index_A += 1
        elseif (A[temp_index_A] == B[temp_index_B])
            push!(ABintersect,A[temp_index_A])
            temp_index_A += 1
            temp_index_B += 1
        elseif A[temp_index_A] < B[temp_index_B]
            push!(ABintersect,A[temp_index_A])
            temp_index_A += 1
        else
            push!(ABintersect,B[temp_index_B])
            temp_index_B += 1
        end
    end

    return ABintersect
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

