function sortedintersect(A::Array, B::Array)
    ABintersect = Array{typeof(A),1}
    temp_index_A = 1
    temp_index_B = 1

    while (temp_index_A <= length(A)) & (temp_index_B <= length(B))
        if A[temp_index_A] == B[temp_index_B]
            push!(ABintersect,A[temp_index_A])
            temp_index_A += 1
            temp_index_B += 1
        elseif A[temp_index_A] < B[temp_index_B]
            temp_index_A += 1
        else
            temp_index_B += 1
        end
    end

    return ABintersect
end
