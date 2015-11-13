function abs(A:Assoc)
    #abs: Absolutee value of an inputted numerical associative array.

    if isa(A.val[1],AbstractString)
        error("Attempt to Abs a string valued Associative Array, only numerical Associative Array is accepted")
    end

    AT = deepcopy(A)
    AT.A = abs(AT.A)
    return AT
end
