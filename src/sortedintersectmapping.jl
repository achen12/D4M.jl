function sortedintersectmapping(A::Array, B::Array)
    #Compute intersect of two sorted and unique array.
    #return the mapping from each array to the intersect
    temp_index_A = 1
    temp_index_B = 1
    Amap = Array{Int64,1}()
    Bmap = Array{Int64,1}()

    while (temp_index_A <= length(A)) & (temp_index_B <= length(B))
        if A[temp_index_A] == B[temp_index_B]
            push!(Amap, temp_index_A)
            push!(Bmap, temp_index_B)
            temp_index_A += 1
            temp_index_B += 1
        elseif A[temp_index_A] < B[temp_index_B]
            temp_index_A += 1
        else
            temp_index_B += 1
        end
    end

    return Amap,Bmap
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

