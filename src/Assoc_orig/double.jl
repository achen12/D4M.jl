function double(A::Assoc)
    if !isempty(A.val)
        error("Non-Numeric is not suppose to use method: double")
    end
    A.A = map(Float64,A.A)
    return A
end
